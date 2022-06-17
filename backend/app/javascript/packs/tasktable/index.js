let text_form = document.getElementById('text_form');
text_form.addEventListener('keypress', test_ivent);

function test_ivent(e) {
    let table = document.getElementById('targetTable');
    let currentRow = this.parentElement.parentElement
    
    if (e.keyCode === 13) {
        let newRow = table.insertRow(currentRow.rowIndex + 1);
        let currentTaskId = Number(this.parentElement.previousElementSibling.innerText)
        let nextTaskId = currentTaskId + 1
        let newCell = newRow.insertCell();
        let newText = document.createTextNode(nextTaskId);
        newCell.appendChild(newText);
        newCell = newRow.insertCell();
        let inputForm = document.createElement('input')
        inputForm.type = 'text';
        inputForm.id = 'form' + nextTaskId;
        inputForm.onkeydown = test_ivent
        newCell.appendChild(inputForm);
        document.getElementById(inputForm.id).focus()
    }
    else if (e.keyCode === 9) {
        let currentText = this.value
        console.log(currentText)
        
    }  
    return false;
}