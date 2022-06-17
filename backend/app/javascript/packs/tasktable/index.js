let text_form = document.getElementById('text_form');
text_form.addEventListener('keypress', test_ivent);

function test_ivent(e) {
    let table = document.getElementById('targetTable');
    let currentRow = this.parentElement.parentElement
    
    //Enterキー押下時
    if (e.key === 'Enter') {
        let newRow = table.insertRow(currentRow.rowIndex + 1); //行の追加
        let currentTaskId = currentRow.firstElementChild.innerText //現在のidを取得
        //！！！
        let nextTaskId = Number + 1 //次のidを生成
        console.log(currentTaskId)
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
    //tabキー押下時
    else if (e.key === 'Tab') {
    //子タスクIDを付与する
        //親タスクのIDを取得
        let previousRow = currentRow.previousElementSibling; //前の行を取得
        let parentId = previousRow.firstElementChild.innerText;//親Idを取得
        //子タスクIDの生成
        childId = parentId + ".1"
        //子タスクIDの書き換え
        currentRow.firstElementChild.innerText = childId
    }  
    return false;
}