using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            AppDataContainer dataContext = new AppDataContainer();

            if (dataContext.Students.Count() == 0)
                RegisterStudentInCourse(dataContext);

            DisplayStudentCourseEnrollments(dataContext);


            dataContext.Dispose();
        }

        private static void RegisterStudentInCourse(AppDataContainer dataContext)
        {            
            Course course = new Course();
            course.Id = Guid.NewGuid();
            course.Title = "First Course";
            dataContext.Courses.Add(course);

            Student student = dataContext.Students.Add(new Student());
            student.Id = Guid.NewGuid();
            student.FirstName = "Mary";
            student.LastName = "Jones";
            student.GradeLevel = "1";

            Enrollment enrollment = new Enrollment();
            enrollment.Id = Guid.NewGuid();
            enrollment.Student = student;
            enrollment.Course = course;
            enrollment.Grade = "A";
            dataContext.Enrollments.Add(enrollment);

            dataContext.SaveChanges();
        }

        private static void DisplayStudentCourseEnrollments(AppDataContainer dataContext)
        {
            foreach (var enrollment in dataContext.Enrollments)
            {
                Console.WriteLine($"{enrollment.Course.Title} - {enrollment.Student.FirstName} {enrollment.Student.LastName}");
            }
        }
    }
}
