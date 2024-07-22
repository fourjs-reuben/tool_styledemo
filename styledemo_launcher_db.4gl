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
    INSERT INTO widget_names VALUES ("Button", 1)
    INSERT INTO widget_names VALUES ("ButtonEdit", 1)
    INSERT INTO widget_names VALUES ("CheckBox", 1)
    INSERT INTO widget_names VALUES ("ComboBox", 1)
    INSERT INTO widget_names VALUES ("DateEdit", 1)
    INSERT INTO widget_names VALUES ("DateTimeEdit", 1)
    INSERT INTO widget_names VALUES ("Edit", 1)
    INSERT INTO widget_names VALUES ("Folder", 1)
    INSERT INTO widget_names VALUES ("Grid", 1)
    INSERT INTO widget_names VALUES ("Group", 1)
    INSERT INTO widget_names VALUES ("HBox", 1)
    INSERT INTO widget_names VALUES ("Image", 1)
    INSERT INTO widget_names VALUES ("Label", 1)
    INSERT INTO widget_names VALUES ("Page", 1)
    INSERT INTO widget_names VALUES ("ProgressBar", 1)
    INSERT INTO widget_names VALUES ("RadioGroup", 1)
    INSERT INTO widget_names VALUES ("ScrollGrid", 1)
    INSERT INTO widget_names VALUES ("Slider", 1)
    INSERT INTO widget_names VALUES ("SpinEdit", 1)
    INSERT INTO widget_names VALUES ("Table", 1)
    INSERT INTO widget_names VALUES ("TextEdit", 1)
    INSERT INTO widget_names VALUES ("TimeEdit", 1)
    INSERT INTO widget_names VALUES ("Tree", 1)
    INSERT INTO widget_names VALUES ("VBox", 1)
    INSERT INTO widget_names VALUES ("WebComponent", 1)
END FUNCTION

FUNCTION widget_attribute_names()
    CREATE TABLE widget_attribute_names (widget CHAR(20), name CHAR(20), weight INTEGER)

    -- Edit TODO https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_FormSpecFiles_EDIT_Item_Type.html


    INSERT INTO widget_attribute_names VALUES ("edit", "autonext", 1) 
    INSERT INTO widget_attribute_names VALUES ("edit", "comment", 1) 
    INSERT INTO widget_attribute_names VALUES ("edit", "invisible", 1) 
    INSERT INTO widget_attribute_names VALUES ("edit", "justify", 1) 
    INSERT INTO widget_attribute_names VALUES ("edit", "placeholder", 1) 
    INSERT INTO widget_attribute_names VALUES ("edit", "scroll", 1) 
    INSERT INTO widget_attribute_names VALUES ("edit", "stretch", 1) 

    -- TODO populate with children from https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_FormSpecFiles_ATTRIBUTES_section.html
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
    -- TODO matrix? 
    -- TOODO tree?
END FUNCTION

FUNCTION dialog_names()
    CREATE TABLE dialog_names (DIALOG CHAR(20), weight INTEGER)
    INSERT INTO dialog_names VALUES ("input", 1)
    -- TDOO construct
    -- TODO display array
    -- TODO input array
    -- TODO menu
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

    -- backgroundColor, defaultTTGColorm textColor  
    -- https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/c_fgl_presentation_styles_015.html
    -- list the TTY colors first
    INSERT INTO common_style_attributes VALUES("color", "black", 1)
    INSERT INTO common_style_attributes VALUES("color", "blue", 1)
    INSERT INTO common_style_attributes VALUES("color", "cyan", 1)
    INSERT INTO common_style_attributes VALUES("color", "green", 1)
    INSERT INTO common_style_attributes VALUES("color", "magenta", 1)
    INSERT INTO common_style_attributes VALUES("color", "red", 1)
    INSERT INTO common_style_attributes VALUES("color", "white", 1)
    INSERT INTO common_style_attributes VALUES("color", "yellow", 1)
    
    -- TOOD add html colors here
    -- TODO add generic colors

    -- all 655356 RGB colors
    -- TODO maybe doa widget for thse
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
    -- TODO Button https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_button_style_attributes.html
    -- TODO ButtonEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_buttonedit_style_attributes.html
    -- TODO CheckBox https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_checkbox_style_attributes.html
    -- TODO DateEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_dateedit_style_attributes.html
    -- TODO DateTimeEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_datetimeedit_style_attributes.html
    -- TODO Image https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_image_style_attributes.html
    -- TODO Label https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_label_style_attributes.html
    -- TODO ProgressBar https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_progressbar_style_attributes.html
    -- TODO TextEdit https://4js.com/online_documentation/fjs-fgl-manual-html/#fgl-topics/r_fgl_presentation_styles_textedit_style_attributes.html
END FUNCTION
