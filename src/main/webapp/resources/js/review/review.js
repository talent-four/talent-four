

document.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('.radio-button');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            buttons.forEach(btn => btn.classList.remove('selected'));

            button.classList.add('selected');

            const value = button.getAttribute('data-value');
            const radioButton = document.querySelector(`input[type="radio"][value="${value}"]`);
            radioButton.checked = true;
        });
    });
});


const write = document.querySelector(".btn3");

write.addEventListener("click", ()=>{

    document.querySelector("#background-modal").hidden= false;
    document.querySelector("#write-modal").hidden= false;

});

document.querySelector("#write-btn2").addEventListener("click", ()=>{

    document.querySelector("#background-modal").hidden= true;
    document.querySelector("#write-modal").hidden= true;    

});