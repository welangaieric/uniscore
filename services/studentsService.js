const { createRecord, readRecord, updateRecord, deleteRecord } = require('./crud');
const getAllstudent = async()=>{
    const student = await readRecord('students','*',"");
    console.log('student:', student);
    return student
}
const getstudentbyphone = async(adm)=>{
    const student = await readRecord('students','*',`stdAdm='${adm}'`);
    console.log('student:', student);
    return student
}
const addstudent = async (studentName,course, year,semester,stdAdm)=>{
    const newLecturer = await createRecord('students', ['studentName','course', 'year','semester','stdAdm'], [studentName,course, year,semester,stdAdm]);
    console.log('New Lecturer:', newLecturer);
    return newLecturer
}
const updatestudent = async(studentName,course, year,semester,stdAdm,id)=>{
    const updatedLecturer = await updateRecord('students',['studentName','course', 'year','semester','stdAdm'], `id = '${id}'`, [studentName,course, year,semester,stdAdm]);
    console.log('Updated Lecturer:', updatedLecturer);
    return updatedLecturer
}
const deletestudent = async(id)=>{
      // Delete Lecturer
  const deletedLecturer = await deleteRecord('students', `id = '${id}' `);
  console.log('Deleted Lecturer:', deletedLecturer);
  return deletedLecturer
}
module.exports={getAllstudent,addstudent,updatestudent,deletestudent,getstudentbyphone}