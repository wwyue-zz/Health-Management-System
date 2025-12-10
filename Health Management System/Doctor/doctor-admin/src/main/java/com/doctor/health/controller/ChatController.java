package com.doctor.health.controller;
import com.alibaba.dashscope.aigc.generation.*;
import com.alibaba.dashscope.common.Message;
import com.alibaba.dashscope.common.Role;
import com.alibaba.dashscope.exception.ApiException;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.doctor.health.domain.FollowUpRecords;
import com.doctor.health.domain.HealthRecords;
import com.doctor.health.domain.HypertensionPatients;
import com.doctor.health.service.IFollowUpRecordsService;
import com.doctor.health.service.IHealthRecordsService;
import com.doctor.health.service.IHypertensionPatientsService;
import io.reactivex.Flowable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import java.util.Arrays;
import java.util.List;
@RestController
@RequestMapping("/ai")
public class ChatController {
    @Autowired
    private IHypertensionPatientsService hypertensionPatientsService;
    @Autowired
    private IFollowUpRecordsService followUpRecordsService;
    @Autowired
    private IHealthRecordsService healthRecordsService;

    private static StringBuilder fullContent = new StringBuilder();
    private static boolean isFirstPrint = true;

    private static void handleGenerationResult(GenerationResult message) {
        String reasoning = message.getOutput().getChoices().get(0).getMessage().getReasoningContent();
        String content = message.getOutput().getChoices().get(0).getMessage().getContent();
        SearchInfo searchInfo = message.getOutput().getSearchInfo();
        if (!reasoning.isEmpty()) {
            //System.out.println("====================搜索信息====================\n");
            searchInfo.getSearchResults();
            //System.out.println("====================思考过程====================\n");
            //fullContent.append(reasoning);
        }
        if (!content.isEmpty()) {
            //System.out.println("\n====================完整回复====================\n");
            fullContent.append(content);
        }
        System.out.println(fullContent);
        if (message.getOutput().getChoices().get(0).getFinishReason().equals("stop") || message.getOutput().getChoices().get(0).getFinishReason().equals("length")){
            fullContent.append("\n====================Token 消耗====================\n");
            fullContent.append(message.getUsage());
        }
    }
    @RequestMapping(value = "/chat")
    public String streamCallWithMessage(@RequestParam("patientName") String prompt,
            @RequestParam(value = "files", required = false) List<MultipartFile> files)
            throws NoApiKeyException, ApiException, InputRequiredException {
        HypertensionPatients patient = new HypertensionPatients();
        FollowUpRecords followUpRecord = new FollowUpRecords();
        HealthRecords healthRecord = new HealthRecords();
        followUpRecord.setName(prompt);
        patient.setName(prompt);
        healthRecord.setName(prompt);
        List<HypertensionPatients> patients = hypertensionPatientsService.selectHypertensionPatientsList(patient);
        List<FollowUpRecords> followUpRecords = followUpRecordsService.selectFollowUpRecordsList(followUpRecord);
        List<HealthRecords> healthRecords = healthRecordsService.selectHealthRecordsList(healthRecord);
        if (patients.isEmpty()) {
            return "No patient information found. Please check if the entered name is correct.";
        }
        patient = patients.get(0);
        followUpRecord = followUpRecords.get(0);
        healthRecord = healthRecords.get(0);

        StringBuilder sb = new StringBuilder("The queried patient information is as follows:");
        sb.append("Patient's basic information: \n" + patient.toString() + "\n");
        sb.append("Patient's doctor follow-up records: \n" + followUpRecord.toString() + "\n");
        sb.append("Patient's blood pressure data: \n" + healthRecord.toString() + "\n");
        sb.append("Based on the above information, please provide a brief patient health assessment and lifestyle and dietary recommendations. Please format the final result using HTML code" +
                "for beautification, and return the result according to the HTML template I provided below. Only return the HTML source code.\n");
        sb.append("```html\n" +
                "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Patient Health Assessment Report</title>\n" +
                "    <style>\n" +
                "        body { font-family: Arial, sans-serif; }\n" +
                "        table { border-collapse: collapse; width: 100%; margin: 20px 0; }\n" +
                "        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }\n" +
                "        th { background-color: #f4f4f4; }\n" +
                "        .high-risk { background-color: #ffcccc; }\n" +
                "        .caution { background-color: #ffffcc; }\n" +
                "        .green-bg { background-color: #e8f5e9; }\n" +
                "        .icon { font-size: 18px; color: #28a745; }\n" +
                "        .red { color: #dc3545; }\n" +
                "        .bold { font-weight: bold; }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <h1 style=\"color: #1a73e8; text-align: center;\">Patient Jianguo Zhang Health Assessment Report</h1>\n" +
                "\n" +
                "    <!-- Patient Basic Information -->\n" +
                "    <table>\n" +
                "        <tr><th colspan=\"2\" style=\"background-color: #e9ecef;\">Patient Basic Information</th></tr>\n" +
                "        <tr><td>Name</td><td>Jianguo Zhang</td></tr>\n" +
                "        <tr><td>Gender</td><td>Male</td></tr>\n" +
                "        <tr><td>Age</td><td>60 years old</td></tr>\n" +
                "        <tr><td>BMI</td><td>25.5 <span class=\"caution\">(Overweight)</span></td></tr>\n" +
                "        <tr><td>Family History</td><td>Father has hypertension</td></tr>\n" +
                "        <tr><td>Complications</td><td>Coronary heart disease, Diabetes</td></tr>\n" +
                "    </table>\n" +
                "\n" +
                "    <!-- Health Assessment -->\n" +
                "    <table>\n" +
                "        <tr><th colspan=\"2\" style=\"background-color: #e9ecef;\">Health Assessment</th></tr>\n" +
                "        <tr><td>Blood Pressure Level</td><td>Stage 2 Hypertension <span class=\"red\">&#x26a0;</span></td></tr>\n" +
                "        <tr><td>Risk Level</td><td class=\"high-risk\">High Risk <span class=\"red\">⚠\uFE0F</span></td></tr>\n" +
                "        <tr><td>Latest Symptoms</td><td>Morning dizziness <span class=\"red\">⚠\uFE0F</span></td></tr>\n" +
                "        <tr><td>Doctor's Assessment</td><td>Unstable blood pressure control</td></tr>\n" +
                "    </table>\n" +
                "\n" +
                "    <!-- Lifestyle Recommendations -->\n" +
                "    <div style=\"background-color: #f8f9fa; padding: 20px;\">\n" +
                "        <h2 style=\"color: #007bff;\">Lifestyle Management Recommendations</h2>\n" +
                "        <ul>\n" +
                "            <li class=\"green-bg icon\">&#x2695; Strict blood pressure monitoring: Measure morning and evening, seek medical attention if abnormal</li>\n" +
                "            <li class=\"green-bg icon\">&#x2665; Exercise plan: 30 minutes of aerobic exercise daily (e.g., walking, Tai Chi)</li>\n" +
                "            <li class=\"green-bg icon\">&#x2696; Avoid triggers: Quit smoking, limit alcohol, reduce caffeine intake</li>\n" +
                "            <li class=\"green-bg icon\">&#x270e; Psychological adjustment: Relieve stress through meditation/deep breathing</li>\n" +
                "            <li class=\"green-bg icon\">&#x1f4c3; Medication adherence: Strictly follow doctor's orders, do not stop medication without permission</li>\n" +
                "        </ul>\n" +
                "    </div>\n" +
                "\n" +
                "    <!-- Dietary Recommendations -->\n" +
                "    <div style=\"background-color: #f8f9fa; padding: 20px;\">\n" +
                "        <h2 style=\"color: #007bff;\">Dietary Management Recommendations</h2>\n" +
                "        <ul>\n" +
                "            <li class=\"green-bg icon\">&#x1f354; Low-salt diet: Daily salt intake <5g, avoid pickled foods</li>\n" +
                "            <li class=\"green-bg icon\">&#x1f951; Sugar control strategy: Choose low GI foods (e.g., oats, brown rice)</li>\n" +
                "            <li class=\"green-bg icon\">&#x1f957; Increase dietary fiber: Daily intake of vegetables 500g+, fruits 200g</li>\n" +
                "            <li class=\"green-bg icon\">&#x1f37d; Fat reduction plan: Choose fish, soy products instead of red meat</li>\n" +
                "            <li class=\"green-bg icon\">&#x1f967; Fractional meals: Adopt small, frequent meals, avoid overeating</li>\n" +
                "        </ul>\n" +
                "    </div>\n" +
                "\n" +
                "    <p style=\"text-align: right; color: #6c757d; font-size: 0.9em;\">Data source: Patient Electronic Health Record [ref_无]</p>\n" +
                "</body>\n" +
                "</html>");
        prompt = sb.toString();
        fullContent.delete(0,fullContent.length());
        Generation gen = new Generation();
        Message userMsg = Message.builder().role(Role.USER.getValue()).content(prompt).build();
        GenerationParam param = buildGenerationParam(userMsg);
        System.out.println("开始思考");
        Flowable<GenerationResult> result = gen.streamCall(param);
        result.blockingForEach(message -> handleGenerationResult(message));
        System.out.println("思考结束");
        return fullContent.toString().replaceAll("\\[ref_[^\\]]*\\]", "");
    }
    private static GenerationParam buildGenerationParam(Message userMsg) {
         // 定义搜索策略
        SearchOptions searchOptions = SearchOptions.builder()
                // 使返回结果中包含搜索信息的来源
                .enableSource(true)
                // 强制开启互联网搜索
                .forcedSearch(true)
                // 开启角标标注
                .enableCitation(true)
                // 设置角标标注样式为[ref_i]
                .citationFormat("[ref_<number>]")
                // 联网搜索10条信息
                .searchStrategy("pro")
                .build();
        return GenerationParam.builder()
                // 若没有配置环境变量，请用百炼API Key将下行替换为：.apiKey("sk-xxx")
                .apiKey("sk-4ce55ad2e0174b4cbe66ffe250209533")
                .model("qwq-plus")   // 此处以qwen-plus为例，您可按需更换模型名称。模型列表：https://help.aliyun.com/zh/model-studio/getting-started/models
                .messages(Arrays.asList(userMsg))
                .resultFormat(GenerationParam.ResultFormat.MESSAGE)
                .enableSearch(true)
                .searchOptions(searchOptions)
                .incrementalOutput(true)
                .build();
    }

}
