document.addEventListener('DOMContentLoaded', function() {
    var wonderFQ = document.getElementById('wonderFQ');
    var wonderCQ = document.getElementById('wonderCQ');

    var selectedLinkId = localStorage.getItem('selectedLinkId');
    if (selectedLinkId) {
        var selectedLink = document.getElementById(selectedLinkId);
        if (selectedLink) {
            selectedLink.classList.add('wonderCurrent');
        }
    }

    var currentLink = document.querySelector('.wonderCurrent');

    function handleClick(event) {
        if (currentLink) {
            currentLink.classList.remove('wonderCurrent');  
        }
        this.classList.add('wonderCurrent');  
        currentLink = this;  

        localStorage.setItem('selectedLinkId', this.id);
    }

    wonderFQ.addEventListener('click', handleClick);
    wonderCQ.addEventListener('click', handleClick);
});