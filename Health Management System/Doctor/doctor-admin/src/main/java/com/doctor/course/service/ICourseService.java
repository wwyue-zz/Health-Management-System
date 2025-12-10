package com.doctor.course.service;

import java.util.List;
import com.doctor.course.domain.Course;


public interface ICourseService 
{
    
    public Course selectCourseById(Long id);

    
    public List<Course> selectCourseList(Course course);

    public int insertCourse(Course course);

    
    public int updateCourse(Course course);

    
    public int deleteCourseByIds(Long[] ids);

    public int deleteCourseById(Long id);
}
