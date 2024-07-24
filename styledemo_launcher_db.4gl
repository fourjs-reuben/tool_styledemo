IMPORT util

FUNCTION populate_db()

    CALL widget_names()
    CALL widget_attribute_names()
    CALL widget_attribute_values()
    CALL container_names()
    CALL dialog_names()
    CALL style_names()
    CALL common_style_attributes()
    CALL widget_style_attributes()
END FUNCTION

FUNCTION widget_names()
    CREATE TABLE widget_names(widget CHAR(20), weight INTEGER)
    INSERT INTO widget_names VALUES ("ButtonEdit", 1)
    INSERT INTO widget_names VALUES ("CheckBox", 1)
    INSERT INTO widget_names VALUES ("ComboBox", 1)
    INSERT INTO widget_names VALUES ("DateEdit", 1)
    INSERT INTO widget_names VALUES ("DateTimeEdit", 1)
    INSERT INTO widget_names VALUES ("Edit", 1)
    INSERT INTO widget_names VALUES ("Image", 1)
    INSERT INTO widget_names VALUES ("Label", 1)
    INSERT INTO widget_names VALUES ("ProgressBar", 1)
    INSERT INTO widget_names VALUES ("RadioGroup", 1)
    INSERT INTO widget_names VALUES ("Slider", 1)
    INSERT INTO widget_names VALUES ("SpinEdit", 1)
    INSERT INTO widget_names VALUES ("TextEdit", 1)
    INSERT INTO widget_names VALUES ("TimeEdit", 1)
END FUNCTION

FUNCTION widget_attribute_names()
    CREATE TABLE widget_attribute_names (widget CHAR(20), name CHAR(20), weight INTEGER)

    -- Edit TODO https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_FormSpecFiles_EDIT_Item_Type.html


    INSERT INTO widget_attribute_names VALUES ("Edit", "autonext", 1) 
    INSERT INTO widget_attribute_names VALUES ("Edit", "comment", 1) 
    INSERT INTO widget_attribute_names VALUES ("Edit", "invisible", 1) 
    INSERT INTO widget_attribute_names VALUES ("Edit", "justify", 1) 
    INSERT INTO widget_attribute_names VALUES ("Edit", "placeholder", 1) 
    INSERT INTO widget_attribute_names VALUES ("Edit", "scroll", 1) 
    INSERT INTO widget_attribute_names VALUES ("Edit", "stretch", 1) 

    -- TODO populate with children from https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_FormSpecFiles_ATTRIBUTES_section.html

    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "autonext", 2) 
    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "comment", 2) 
    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "invisible", 2) 
    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "justify", 2) 
    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "placeholder", 2) 
    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "scroll", 2) 
    INSERT INTO widget_attribute_names VALUES ("Buttonedit", "stretch", 2)

    INSERT INTO widget_attribute_names VALUES ("CheckBox", "comment", 3) 
    INSERT INTO widget_attribute_names VALUES ("CheckBox", "justify", 3) 

    INSERT INTO widget_attribute_names VALUES ("DateEdit", "autonext", 4) 
    INSERT INTO widget_attribute_names VALUES ("DateEdit", "comment", 4) 
    INSERT INTO widget_attribute_names VALUES ("DateEdit", "invisible", 4) 
    INSERT INTO widget_attribute_names VALUES ("DateEdit", "justify", 4) 
    INSERT INTO widget_attribute_names VALUES ("DateEdit", "placeholder", 4) 
    INSERT INTO widget_attribute_names VALUES ("DateEdit", "scroll", 4) 
    INSERT INTO widget_attribute_names VALUES ("DateEdit", "stretch", 4)

    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "autonext", 5) 
    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "comment", 5) 
    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "invisible", 5) 
    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "justify", 5) 
    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "placeholder", 5) 
    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "scroll", 5) 
    INSERT INTO widget_attribute_names VALUES ("DateTimeEdit", "stretch", 5)

    INSERT INTO widget_attribute_names VALUES ("Image", "comment", 6) 
    INSERT INTO widget_attribute_names VALUES ("Image", "justify", 6) 
    INSERT INTO widget_attribute_names VALUES ("Image", "stretch", 6)
    
    INSERT INTO widget_attribute_names VALUES ("Label", "comment", 7) 
    INSERT INTO widget_attribute_names VALUES ("Label", "justify", 7) 
    INSERT INTO widget_attribute_names VALUES ("Label", "stretch", 7)

    INSERT INTO widget_attribute_names VALUES ("ProgressBar", "comment", 8) 
    INSERT INTO widget_attribute_names VALUES ("ProgressBar", "justify", 8) 
    INSERT INTO widget_attribute_names VALUES ("ProgressBar", "stretch", 8)

    INSERT INTO widget_attribute_names VALUES ("RadioGroup", "comment", 8) 
    INSERT INTO widget_attribute_names VALUES ("RadioGroup", "justify", 8) 
    INSERT INTO widget_attribute_names VALUES ("RadioGroup", "stretch", 8)

    INSERT INTO widget_attribute_names VALUES ("TextEdit", "comment", 9) 
    INSERT INTO widget_attribute_names VALUES ("TextEdit", "justify", 9) 
    INSERT INTO widget_attribute_names VALUES ("TextEdit", "placeholder", 9) 
    INSERT INTO widget_attribute_names VALUES ("TextEdit", "scroll", 9) 
    INSERT INTO widget_attribute_names VALUES ("TextEdit", "stretch", 9)

    INSERT INTO widget_attribute_names VALUES ("TimeEdit", "autonext", 10) 
    INSERT INTO widget_attribute_names VALUES ("TimeEdit", "comment", 10) 
    INSERT INTO widget_attribute_names VALUES ("TimeEdit", "justify", 10) 
    INSERT INTO widget_attribute_names VALUES ("TimeEdit", "placeholder", 10) 
    INSERT INTO widget_attribute_names VALUES ("TimeEdit", "stretch", 10)
    
END FUNCTION

FUNCTION widget_attribute_values()
    CREATE TABLE widget_attribute_values (widget CHAR(20), name CHAR(20), value CHAR(20), weight INTEGER)

    -- https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_FSFAttributes_JUSTIFY.html
    INSERT INTO widget_attribute_values VALUES("edit", "justify", "left", 1) 
    INSERT INTO widget_attribute_values VALUES ("edit", "justify", "center", 2) 
    INSERT INTO widget_attribute_values VALUES ("edit", "justify", "right", 3) 

    -- https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_FSFAttributes_STRETCH.html
    INSERT INTO widget_attribute_values VALUES ("edit", "stretch", "none", 1)
    INSERT INTO widget_attribute_values VALUES ("edit", "stretch", "x", 1)
    INSERT INTO widget_attribute_values VALUES ("edit", "stretch", "y", 1)
    INSERT INTO widget_attribute_values VALUES ("edit", "stretch", "both", 1)
END FUNCTION

FUNCTION container_names()
    CREATE TABLE container_names (container CHAR(20), weight INTEGER)
    INSERT INTO container_names VALUES ("grid", 1)
    INSERT INTO container_names VALUES ("table", 2)
    INSERT INTO container_names VALUES ("scrollgrid", 3)
    INSERT INTO container_names VALUES ("matrix", 4)
    INSERT INTO container_names VALUES ("tree", 5)
END FUNCTION

FUNCTION dialog_names()
    CREATE TABLE dialog_names (dialog CHAR(20), weight INTEGER)
    INSERT INTO dialog_names VALUES ("Input", 1)
    INSERT INTO dialog_names VALUES ("Menu", 2)
    INSERT INTO dialog_names VALUES ("Construct", 3)
    INSERT INTO dialog_names VALUES ("Display Array", 4)
    INSERT INTO dialog_names VALUES ("Input Array", 5)
END FUNCTION

FUNCTION style_names()
    CREATE TABLE style_names (widget CHAR(20), name CHAR(20), weight INTEGER)
    -- Common https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_common_style_attributes.html
    INSERT INTO style_names VALUES("common", "", 1)
    INSERT INTO style_names VALUES("common", "backgroundColor", 1)
    INSERT INTO style_names VALUES("common", "border", 1)
    INSERT INTO style_names VALUES("common", "defaultTTFColor", 1)
    INSERT INTO style_names VALUES("common", "fontFamily", 1)
    INSERT INTO style_names VALUES("common", "fontSize", 1)
    INSERT INTO style_names VALUES("common", "fontStyle", 1)
    INSERT INTO style_names VALUES("common", "fontWeight", 1)
    INSERT INTO style_names VALUES("common", "textColor", 1)
    INSERT INTO style_names VALUES("common", "textDecoration", 1)

    CREATE INDEX sn1 ON style_names(widget, weight, name)
END FUNCTION

FUNCTION common_style_attributes()
    DEFINE i INTEGER
    DEFINE s STRING

    CREATE TABLE common_style_attributes (name CHAR(20), value CHAR(20), weight INTEGER)

    -- border https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_common_style_attributes.html#r_fgl_presentation_styles_common_style_attributes__row_border
    INSERT INTO common_style_attributes VALUES("border", "no", 1)
    INSERT INTO common_style_attributes VALUES("border", "yes", 1)

    -- font size https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_presentation_styles_font_size.html
    INSERT INTO common_style_attributes VALUES("font_size", "xx-small", 1)
    INSERT INTO common_style_attributes VALUES("font_size", "x-small", 2)
    INSERT INTO common_style_attributes VALUES("font_size", "small", 3)
    INSERT INTO common_style_attributes VALUES("font_size", "medium", 4)
    INSERT INTO common_style_attributes VALUES("font_size", "large", 5)
    INSERT INTO common_style_attributes VALUES("font_size", "x-large", 6)
    INSERT INTO common_style_attributes VALUES("font_size", "xx-large", 7)
    FOR i = 1 TO 96
        LET s = i USING "<<", "pt"
        INSERT INTO common_style_attributes VALUES("font_size", s, 30 + i)
    END FOR
    INSERT INTO common_style_attributes VALUES("font_size", "0.5em", 20)
    INSERT INTO common_style_attributes VALUES("font_size", "0.75em", 20)
    INSERT INTO common_style_attributes VALUES("font_size", "1em", 20)
    INSERT INTO common_style_attributes VALUES("font_size", "1.25em", 20)
    INSERT INTO common_style_attributes VALUES("font_size", "1.5em", 20)
    INSERT INTO common_style_attributes VALUES("font_size", "2em", 20)
    INSERT INTO common_style_attributes VALUES("font_size", "3em", 20)

    -- font style https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_presentation_styles_font_style.html
    INSERT INTO common_style_attributes VALUES("font_style", "italic", 1)
    INSERT INTO common_style_attributes VALUES("font_style", "oblique", 1)
    INSERT INTO common_style_attributes VALUES("font_style", "roman", 1)

    -- font weight https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_presentation_styles_font_weight.html
    INSERT INTO common_style_attributes VALUES("font_weight", "normal", 1)
    INSERT INTO common_style_attributes VALUES("font_weight", "bold", 1)
    INSERT INTO common_style_attributes VALUES("font_weight", "bolder", 1)
    INSERT INTO common_style_attributes VALUES("font_weight", "lighter", 1)
    FOR i = 1 TO 1000
        LET s = i USING "<<<<"
        INSERT INTO common_style_attributes VALUES("font_weight", s, 10 + i)
    END FOR

    -- text decoration https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_common_style_attributes.html#r_fgl_presentation_styles_common_style_attributes__row_textDecoration
    INSERT INTO common_style_attributes VALUES("text_decoration", "line-through", 1)
    INSERT INTO common_style_attributes VALUES("text_decoration", "overline", 1)
    INSERT INTO common_style_attributes VALUES("text_decoration", "underline", 1)

    -- backgroundColor, defaultTTGColorm textColor https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_presentation_styles_015.html
    -- list the TTY colors first
    INSERT INTO common_style_attributes VALUES("color", "black", 1)
    INSERT INTO common_style_attributes VALUES("color", "blue", 1)
    INSERT INTO common_style_attributes VALUES("color", "cyan", 1)
    INSERT INTO common_style_attributes VALUES("color", "green", 1)
    INSERT INTO common_style_attributes VALUES("color", "magenta", 1)
    INSERT INTO common_style_attributes VALUES("color", "red", 1)
    INSERT INTO common_style_attributes VALUES("color", "white", 1)
    INSERT INTO common_style_attributes VALUES("color", "yellow", 1)
    -- add html colors here
    INSERT INTO common_style_attributes VALUES("color", "darkBlue", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkCyan", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkGreen", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkMagenta", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkOlive", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkRed", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkOrange", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkGray", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkTeal", 2)
    INSERT INTO common_style_attributes VALUES("color", "darkYellow", 2)
    INSERT INTO common_style_attributes VALUES("color", "gray", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightBlue", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightCyan", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightGray", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightGreen", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightMagenta", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightOlive", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightOrange", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightRed", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightTeal", 2)
    INSERT INTO common_style_attributes VALUES("color", "lightYellow", 2)
    INSERT INTO common_style_attributes VALUES("color", "olive", 2)
    INSERT INTO common_style_attributes VALUES("color", "orange", 2)
    INSERT INTO common_style_attributes VALUES("color", "teal", 2)
    -- added generic colors
    INSERT INTO common_style_attributes VALUES("color", "appWorkSpace", 3)
    INSERT INTO common_style_attributes VALUES("color", "background", 3)
    INSERT INTO common_style_attributes VALUES("color", "buttonFace", 3)
    INSERT INTO common_style_attributes VALUES("color", "buttonText", 3)
    INSERT INTO common_style_attributes VALUES("color", "grayText", 3)
    INSERT INTO common_style_attributes VALUES("color", "highLight", 3)
    INSERT INTO common_style_attributes VALUES("color", "highLightText", 3)
    INSERT INTO common_style_attributes VALUES("color", "infoBackground", 3)
    INSERT INTO common_style_attributes VALUES("color", "infoText", 3)
    INSERT INTO common_style_attributes VALUES("color", "systemAlternateBackground", 3)
    INSERT INTO common_style_attributes VALUES("color", "window", 3)
    INSERT INTO common_style_attributes VALUES("color", "windowText", 3)
    
    -- TODO maybe do a widget for these
    -- all 655356 RGB colors
    FOR i = 0 TO 65536
        LET s = util.Integer.toHexString(i)
        CASE s.getLength()
            WHEN 1
                LET s = "00000", s
            WHEN 2
                LET s = "0000", s
            WHEN 3
                LET s = "000", s
            WHEN 4
                LET s = "00", s
            WHEN 5
                LET s = "0", s
        END CASE
        LET s = "#", s
        INSERT INTO common_style_attributes VALUES("color", s, 4)
    END FOR

    -- Font-family https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_presentation_styles_font_family.html
    INSERT INTO common_style_attributes VALUES("font_family", "serif", 1)
    INSERT INTO common_style_attributes VALUES("font_family", "sans_serif", 2)
    INSERT INTO common_style_attributes VALUES("font_family", "monospace", 3)
    INSERT INTO common_style_attributes VALUES("font_family", "cursive", 4)
    INSERT INTO common_style_attributes VALUES("font_family", "fantasy", 5)
    -- TODO, where to get list from, how to handle spaces
    INSERT INTO common_style_attributes VALUES("font_family", "courier", 6)
    INSERT INTO common_style_attributes VALUES("font_family", "Times New Roman", 7)
    INSERT INTO common_style_attributes VALUES("font_family", "helvetica", 8)

    CREATE INDEX sa1 ON common_style_attributes(name, weight, value)
END FUNCTION

FUNCTION widget_style_attributes()
    DEFINE i INTEGER
    DEFINE s STRING
    CREATE TABLE widget_style_attributes (widget CHAR(20), name CHAR(20), value CHAR(20), weight INTEGER)
    -- ButtonEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_buttonedit_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("ButtonEdit", "scaleIcon", "no", 1)
    INSERT INTO widget_style_attributes VALUES ("ButtonEdit", "scaleIcon", "yes", 1)
    FOR i = 0 TO 72
        LET s = i USING "<<", "px"
        INSERT INTO widget_style_attributes VALUES ("ButtonEdit", "scaleIcon", s, 1)
    END FOR
    -- CheckBox https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_checkbox_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("CheckBox", "customWidget", "toggleButton", 2)
    -- DateEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_dateedit_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "calendarType", "dropdown", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "calendarType", "modal", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "monday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "tuesday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "wednesday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "thursday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "friday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "saturday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "daysOff", "sunday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "monday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "tuesday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "wednesday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "thursday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "friday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "saturday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "firstDayOfWeek", "sunday", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "showCurrentMonthOnly", "yes", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "showCurrentMonthOnly", "no", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "showWeekNumber", "yes", 3)
    INSERT INTO widget_style_attributes VALUES ("DateEdit", "showWeekNumber", "no", 3)
    -- DateTimeEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_datetimeedit_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "calendarType", "dropdown", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "calendarType", "modal", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "monday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "tuesday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "wednesday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "thursday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "friday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "saturday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "daysOff", "sunday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "monday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "tuesday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "wednesday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "thursday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "friday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "saturday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "firstDayOfWeek", "sunday", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "showCurrentMonthOnly", "yes", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "showCurrentMonthOnly", "no", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "showWeekNumber", "yes", 4)
    INSERT INTO widget_style_attributes VALUES ("DateTimeEdit", "showWeekNumber", "no", 4)
    -- Image https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_image_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "top left", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "top horizontalCenter", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "top right", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "verticalCenter left", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "verticalCenter horizontalCenter", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "verticalCenter right", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "bottom left", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "bottom horizontalCenter", 5)
    INSERT INTO widget_style_attributes VALUES ("Image", "alignment", "bottom right", 5)
    -- Label https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_label_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("Label", "sanitize", "yes", 6)
    INSERT INTO widget_style_attributes VALUES ("Label", "sanitize", "no", 6)
    INSERT INTO widget_style_attributes VALUES ("Label", "textFormat", "plain", 6)
    INSERT INTO widget_style_attributes VALUES ("Label", "textFormat", "html", 6)
    -- ProgressBar https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_progressbar_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("ProgressBar", "percentageVisible", "no", 7)
    INSERT INTO widget_style_attributes VALUES ("ProgressBar", "percentageVisible", "center", 7)
    INSERT INTO widget_style_attributes VALUES ("ProgressBar", "percentageVisible", "system", 7)
    -- TextEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_textedit_style_attributes.html
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "sanitize", "yes", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "sanitize", "no", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "textFormat", "plain", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "textFormat", "html", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "showEditToolBox", "no", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "showEditToolBox", "yes", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "wrapPolicy", "atWordBoundary", 7)
    INSERT INTO widget_style_attributes VALUES ("TextEdit", "wrapPolicy", "anywhere", 7)
END FUNCTION
