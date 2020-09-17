// Copyright (c) 2020 Peter Olszowka. All rights reserved. See copyright document for more details.
// File created by Syd Weinstein on 2020-09-03
// JavaScript source code

var EditCustomText = function () {

    var currentCustomTextID = -1;

    function UpdateTextEditor(customtextid) {
        tinyMCE.remove();

        if (currentCustomTextID < 0 && customtextid >= 0) {
            document.getElementById("customtextid").remove(0);
        }

        currentCustomTextID = customtextid;

        document.getElementById("textcontents").value = document.getElementById('t' + customtextid.toString()).value;
        document.getElementById("texteditor").style.display = 'block';
   
        tinymce.init({
            selector: 'textarea#textcontents',
            plugins: 'table wordcount fullscreen lists advlist link preview searchreplace autolink charmap hr nonbreaking visualchars code ',
            browser_spellcheck: true,
            contextmenu: false,
            height: 400,
            min_height: 200,
            menubar: false,
            toolbar: [
                'undo redo | styleselect | bold italic underline strikethrough removeformat | visualchars nonbreaking charmap hr | preview fullscreen ',
                'searchreplace | alignleft aligncenter alignright alignjustify | outdent indent | numlist bullist checklist | forecolor backcolor | link code'
            ],
            toolbar_mode: 'wrap',
            content_style: 'body {font - family:Helvetica,Arial,sans-serif; font-size:14px }',
            placeholder: 'Type custom content here...'
        });
        return true;
    };

    function ResetTextarea() {
        if (currentCustomTextID >= 0) {
            UpdateTextEditor(currentCustomTextID);
        }
        return false;
    };

    function SaveTextaarea() {
        if (currentCustomTextID >= 0) {
            tinyMCE.triggerSave();
            mysubmit();
            return true;
        }
        return false;
    }

    function UpdateSelected() {
        var e = document.getElementById("customtextid");
        var strValue = e.options[e.selectedIndex].value;
        UpdateTextEditor(strValue);
    };

    this.initialize = function () {
        //called when EditCustomText page has loaded
        var that = this;

        var e = document.getElementById("resetbtn");
        e.addEventListener('click', ResetTextarea);

        e = document.getElementById("customtextid");
        e.addEventListener('change', UpdateSelected);
        var strValue = e.options[e.selectedIndex].value;
        if (strValue >= 0)
            UpdateTextEditor(strValue);

        return true;
    };

};

var editCustomText = new EditCustomText();