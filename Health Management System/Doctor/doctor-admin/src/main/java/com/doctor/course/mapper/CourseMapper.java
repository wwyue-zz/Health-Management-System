package com.doctor.course.mapper;

import java.util.List;
import com.doctor.course.domain.Course;


public interface CourseMapper 
{
   
    public Course selectCourseById(Long id);

    
    public List<Course> selectCourseList(Course course);

    
    public int insertCourse(Course course);

    
    public int updateCourse(Course course);

    
    public int deleteCourseById(Long id);

    
    public int deleteCourseByIds(Long[] ids);
}
