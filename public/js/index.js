(() => {
    const serverUrl = 'http://127.0.0.1:3000';

    // Function to handle all AJAX calls to either fetch or send data to the server
    const Resources = (form, url, type) => {
        let payload;

        if (type === 'get') {
            payload = {
                type: type,
                url: `${serverUrl}${url}`,
            };
        } else {
            payload = {
                type: type,
                url: `${serverUrl}${url}`,
                data: form.serialize(),
            };
        }

        return new Promise((resolve, reject) => {
            $.ajax({
                ...payload,
                success: function(data) {
                    resolve(data);
                },
                error: function(error) {
                    reject(error);
                }
            });
        });
    };
    // show snackbar and hide
    const showSnackbar=(message)=>{
        $('.snackbar').fadeIn()
        $('.message').html(message)
        setTimeout(()=>{
            $('.snackbar').fadeOut()
        },6000)
    }
    // =================================================================================================================
    // FETCHING RESOURCES 
    // =================================================================================================================
    // get students btn
    const studentBtn = $('#studentsBtn')
    studentBtn.on('click',()=>{
        Resources('none',`/students/`,'get')
        .then((data)=>{

            console.log(data)
            const display = $('#studentTable_body')
            display.html('')
            const appendStudent = (student) => {
                const template = ` 
                <tr>
                    <td>${student.studentName}</td>
                    <td>${student.stdAdm}</td>
                    <td>${student.course}</td>
                    <td>${student.year}</td>
                    <td>${student.semester}</td>
                </tr>`;
                display.append(template);
            };
            if (Array.isArray(data)) {
                data.forEach(appendStudent);
            } else if (data && typeof data === 'object') {
                appendStudent(data);
            } else {
                console.error('Invalid data format');
                display.innerHTML = '<tr><td colspan="5">No student data available</td></tr>';
            }
            

        }) 
        .catch((error)=>{
            console.log(error)
            showSnackbar('Error Fetching Students')
        })
    })
    // get Lecturers btn
    const lecBtn = $('#lecBtn')
    lecBtn.on('click',()=>{
        Resources('none',`/lecturers/`,'get')
        .then((data)=>{

            console.log(data)
            const display = $('#lec_body')
            display.html('')
            const appendLecturer = (lec) => {
                const template = ` 
               <tr>
                    <td>${lec.lecturerName}</td>
                    <td>${lec.id}</td>
                    <td>${lec.phone}</td>
                    <td>${lec.email}</td>
                </tr>`;
                display.append(template);
            };
            if (Array.isArray(data)) {
                data.forEach(appendLecturer);
            } else if (data && typeof data === 'object') {
                appendLecturer(data);
            } else {
                console.error('Invalid data format');
                display.innerHTML = '<tr><td colspan="5">No Lecturer data available</td></tr>';
            }
            

        }) 
        .catch((error)=>{
            console.log(error)
            showSnackbar('Error Fetching Students')
        })
    })
    // =================================================================================================
    // ADDING RESOURCES TO DATABASE
    // ================================================================================================
// add users
    const addUserForm = $('#addUser');
    addUserForm.on('submit', (e) => {
        e.preventDefault();
        Resources(addUserForm, '/users/', 'post')
            .then((data) => {
                console.log('Success:', data);
                showSnackbar('success adding User')
                // Handle success (e.g., show a success message, reset form, etc.)
            })
            .catch((error) => {
                console.error('Error:', error);
                showSnackbar('Error adding User')
                // Handle error (e.g., show an error message)
            });
    });

    const addUserBtn = $('.addUserBtn');
    addUserBtn.on('click', () => {
        addUserForm.submit();  // Trigger the form submit event
    });
// add results
    const addResultForm = $('#addResultForm');
    addResultForm.on('submit', (e) => {
        e.preventDefault();
        Resources(addResultForm, '/results/', 'post')
            .then((data) => {
                console.log('Success:', data);
                showSnackbar('success adding Result')
                // Handle success (e.g., show a success message, reset form, etc.)
            })
            .catch((error) => {
                console.error('Error:', error);
                showSnackbar('Error adding Result')
                // Handle error (e.g., show an error message)
            });
    });

    const addResultBtn = $('#addResultBtn');
    addResultBtn.on('click', () => {
        addResultForm.submit();  // Trigger the form submit event
    });
    // add student
    const addStudentForm = $('#addStudentForm');
    addStudentForm.on('submit', (e) => {
        e.preventDefault();
        Resources(addStudentForm, '/students/', 'post')
            .then((data) => {
                console.log('Success:', data);
                showSnackbar('success adding Student')
                // Handle success (e.g., show a success message, reset form, etc.)
            })
            .catch((error) => {
                console.error('Error:', error);
                showSnackbar('Error adding Student')
                // Handle error (e.g., show an error message)
            });
    });

    const addStudentBtn = $('#addStudentBtn');
    addStudentBtn.on('click', () => {
        addStudentForm.submit();  // Trigger the form submit event
    });
     // add lec
     const addLecForm = $('#addLecForm');
     addLecForm.on('submit', (e) => {
         e.preventDefault();
         Resources(addLecForm, '/lecturers/', 'post')
             .then((data) => {
                 console.log('Success:', data);
                 showSnackbar('success adding Lecturer')
                 // Handle success (e.g., show a success message, reset form, etc.)
             })
             .catch((error) => {
                 console.error('Error:', error);
                 showSnackbar('Error adding Lecturer')
                 // Handle error (e.g., show an error message)
             });
     });
 
     const addLecBtn = $('#addLecBtn');
     addLecBtn.on('click', () => {
        addLecForm.submit();  // Trigger the form submit event
     });

    
})();
