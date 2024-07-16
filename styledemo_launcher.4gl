IMPORT xml

TYPE itemsListType DYNAMIC ARRAY OF STRING

DEFINE m_data RECORD

    widget STRING,
    container STRING,
    dialog STRING,

    widget_attribute_arr DYNAMIC ARRAY OF RECORD
        widget_attribute_name STRING,
        widget_attribute_value STRING
    END RECORD,
    widget_style_arr DYNAMIC ARRAY OF RECORD
        widget_style_attribute_name STRING,
        widget_style_attribute_value STRING
    END RECORD,
    common_style_arr DYNAMIC ARRAY OF RECORD
        common_style_attribute_name STRING,
        common_style_attribute_value STRING
    END RECORD
END RECORD

MAIN
    WHENEVER ANY ERROR STOP
    DEFER INTERRUPT
    DEFER QUIT
    OPTIONS INPUT WRAP
    OPTIONS FIELD ORDER FORM

    CALL ui.Interface.loadStyles("styledemo_launcher.4st")
    CALL ui.Interface.loadActionDefaults("styledemo_launcher.4ad")
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "styledemo_launcher" ATTRIBUTES(STYLE="maximized")
    CALL ui.Interface.setText("Launcher")
    
    CONNECT TO ":memory:+driver='dbmsqt'"
    CALL populate_db()
    
    LET m_data.widget = "Edit"
    LET m_data.container = "Grid"
    LET m_data.dialog = "Input"

    DIALOG ATTRIBUTES(UNBUFFERED)
        INPUT BY NAME m_data.widget, m_data.container, m_data.dialog ATTRIBUTES(WITHOUT DEFAULTS = TRUE)
        END INPUT

        INPUT ARRAY m_data.widget_attribute_arr FROM widget_attribute_scr.* ATTRIBUTES(INSERT ROW = FALSE)
            BEFORE INPUT
                CALL ui.Window.getCurrent().getForm().ensureElementVisible("pgper")

            ON CHANGE widget_attribute_name
                CALL populate_widget_attribute_name(DIALOG,"edit", m_data.widget_attribute_arr[arr_curr()].widget_attribute_name)

            ON CHANGE widget_attribute_value
                CALL populate_widget_attribute_value(DIALOG, "edit", m_data.widget_attribute_arr[arr_curr()].widget_attribute_name, m_data.widget_attribute_arr[arr_curr()].widget_attribute_value) 

            AFTER FIELD widget_attribute_name
                DISPLAY build_per() TO per

            AFTER FIELD widget_attribute_value
                DISPLAY build_per() TO per
            
            AFTER ROW
                DISPLAY build_per() TO per
        END INPUT

        INPUT ARRAY m_data.common_style_arr FROM common_style_scr.* ATTRIBUTES(INSERT ROW = FALSE)
            BEFORE INPUT
                CALL ui.Window.getCurrent().getForm().ensureElementVisible("pg4st")

            ON CHANGE common_style_attribute_name
                CALL populate_style_name(DIALOG, "common", m_data.common_style_arr[arr_curr()].common_style_attribute_name)

            ON CHANGE common_style_attribute_value
                CALL populate_style_value(
                    DIALOG, m_data.common_style_arr[arr_curr()].common_style_attribute_name,
                    m_data.common_style_arr[arr_curr()].common_style_attribute_value)

            AFTER FIELD common_style_attribute_value
                DISPLAY build_4st() TO st

            AFTER ROW
                DISPLAY build_4st() TO st

        END INPUT
        
        ON ACTION go
            DISPLAY build_per() TO per
            DISPLAY build_4st() TO st
            RUN "fglform styledemo_test.per"
            -- TODO handle case if form fails to compile
            RUN "fglrun styledemo_test" WITHOUT WAITING
            
        ON ACTION CLEAR ATTRIBUTES(TEXT="Clear")
            INITIALIZE m_data TO NULL
            
        ON ACTION IMPORT ATTRIBUTES(TEXT="Import")
            CALL fgl_winmessage("Info", "Not Implemented", "info") -- TODO read json file and serialize into m_data
            
        ON ACTION export ATTRIBUTES(TEXT="Export")
            CALL fgl_winmessage("Info", "Not implemented", "info") -- TODO implement serialize m_data to json and write to file
            
        ON ACTION close
            EXIT DIALOG
    END DIALOG
END MAIN

FUNCTION populate_widget_attribute_name(d ui.Dialog, widget STRING, BUFFER STRING)
DEFINE list itemsListType

    CALL populate_widget_attribute_name_sql(widget, BUFFER) RETURNING list
    CALL d.setCompleterItems(list)
END FUNCTION

FUNCTION populate_widget_attribute_value(d ui.Dialog, widget STRING, NAME STRING,  BUFFER STRING)
DEFINE list itemsListType

    CALL populate_widget_attribute_value_sql(widget, NAME, BUFFER) RETURNING list
    CALL d.setCompleterItems(list)
END FUNCTION

FUNCTION populate_style_name(d ui.Dialog, widget STRING, buffer STRING)
    DEFINE list itemsListType

    CALL populate_completer_name_sql("common", buffer) RETURNING list
    CALL d.setCompleterItems(list)
END FUNCTION

FUNCTION populate_style_value(d ui.Dialog, att STRING, buffer STRING)
    DEFINE list itemsListType

    CASE att
        WHEN "backgroundColor"
            CALL populate_completer_sql("color", buffer) RETURNING list
        WHEN "border"
            CALL populate_completer_sql("border", buffer) RETURNING list
        WHEN "defaultTTFColor"
            CALL populate_completer_sql("color", buffer) RETURNING list
        WHEN "fontFamily"
            CALL populate_completer_sql("font_family", buffer) RETURNING list
        WHEN "fontSize"
            CALL populate_completer_sql("font_size", buffer) RETURNING list
        WHEN "fontStyle"
            CALL populate_completer_sql("font_style", buffer) RETURNING list
        WHEN "fontWeight"
            CALL populate_completer_sql("font_weight", buffer) RETURNING list

        WHEN "textColor"
            CALL populate_completer_sql("color", buffer) RETURNING list
        WHEN "textDecoration"
            CALL populate_completer_sql("text_decoration", buffer) RETURNING list
    END CASE

    CALL d.setCompleterItems(list)
END FUNCTION



FUNCTION populate_widget_attribute_value_sql(widget STRING, NAME STRING, BUFFER STRING) RETURNS itemsListType
    DEFINE sql STRING
    DEFINE value STRING
    DEFINE list itemsListType

    LET sql = "SELECT FIRST 50 value FROM widget_attribute_values WHERE widget = ? AND name = ? AND value LIKE ? ORDER BY weight, name"
    LET buffer = buffer, "%"

    DECLARE widget_attribute_value_curs CURSOR FROM sql
    OPEN widget_attribute_value_curs USING widget, NAME, buffer

    FOREACH widget_attribute_value_curs INTO value
        LET list[list.getLength() + 1] = value
    END FOREACH
    RETURN list
END FUNCTION

FUNCTION populate_widget_attribute_name_sql(widget STRING, BUFFER STRING) RETURNS itemsListType
    DEFINE sql STRING
    DEFINE name STRING
    DEFINE list itemsListType

    LET sql = "SELECT FIRST 50 name FROM widget_attribute_names WHERE widget = ? AND name LIKE ? ORDER BY weight, name"
    LET buffer = buffer, "%"

    DECLARE widget_attribute_name_curs CURSOR FROM sql
    OPEN widget_attribute_name_curs USING widget, buffer

    FOREACH widget_attribute_name_curs INTO name
        LET list[list.getLength() + 1] = name
    END FOREACH
    RETURN list
END FUNCTION


FUNCTION populate_completer_name_sql(widget STRING, buffer STRING) RETURNS itemsListType
    DEFINE sql STRING
    DEFINE name STRING
    DEFINE list itemsListType

    LET sql = "SELECT FIRST 50 name FROM style_names WHERE widget = ? AND name LIKE ? ORDER BY weight, name"
    LET buffer = buffer, "%"

    DECLARE style_name_curs CURSOR FROM sql
    OPEN style_name_curs USING widget, buffer

    FOREACH style_name_curs INTO name
        LET list[list.getLength() + 1] = name
    END FOREACH
    RETURN list
END FUNCTION

FUNCTION populate_completer_sql(name STRING, buffer STRING) RETURNS itemsListType
    DEFINE sql STRING
    DEFINE value STRING
    DEFINE list itemsListType

    LET sql = "SELECT FIRST 50 value FROM common_style_attributes WHERE name = ? AND value LIKE ? ORDER BY weight, value"
    LET buffer = buffer, "%"

    DECLARE style_value_curs CURSOR FROM sql
    OPEN style_value_curs USING name, buffer

    FOREACH style_value_curs INTO value
        LET list[list.getLength() + 1] = value
    END FOREACH
    RETURN list
END FUNCTION

-- build per file
--write from scratch
FUNCTION build_per() RETURNS STRING
DEFINE sb base.StringBuffer
DEFINE i INTEGER

    LET sb = base.StringBuffer.create()
    CALL sb.append("LAYOUT (TEXT=\"Widget & Style Demo\")\n")
    CALL sb.append("GRID\n") -- TODO replace with container
    CALL sb.append("{\n")
    CALL sb.append("Control [f01                 : ]\n")  -- TODO set grid width to entered value
    CALL sb.append("Test    [f02                 : ]\n")  -- TODO set grid width to entered value
    CALL sb.append("}\n")
    CALL sb.append("END\n")
    CALL sb.append("END\n")
    CALL sb.append("ATTRIBUTES\n")
    CALL sb.append("EDIT f01 = formonly.ctrl;\n")  -- TODO replace edit with widget type
    CALL sb.append("EDIT f02 = formonly.test1, STYLE=\"test\"")  -- TODO replace edit with widget type
    FOR i = 1 TO m_data.widget_attribute_arr.getLength()
        CALL sb.append(", ")
        CALL sb.append(m_data.widget_attribute_arr[i].widget_attribute_name)
        IF m_data.widget_attribute_arr[i].widget_attribute_value.getLength() > 0 THEN
            CALL sb.append(" = ")
            -- TODO implement a way to determine if value is quoted or not
            CALL sb.append(m_data.widget_attribute_arr[i].widget_attribute_value)
        END IF
    END FOR
    CALL sb.append(";\n")
    CALL sb.append("END\n")

    VAR t TEXT
    LOCATE t IN MEMORY
    LET t =  sb.toString()
    CALL t.writeFile("styledemo_test.per")
    RETURN sb.toString()
END FUNCTION

-- build 4st file.
-- Start from a template file and append nodes
FUNCTION build_4st() RETURNS STRING
    DEFINE doc xml.DomDocument
    DEFINE stylelist_node, style_node, styleattribute_node xml.DomNode
    DEFINE i INTEGER

    LET doc = xml.DomDocument.Create()
    CALL doc.load("styledemo_launcher_template.4st")
    CALL doc.setFeature("format-pretty-print", TRUE)
    LET stylelist_node = doc.getDocumentElement()

    LET style_node = stylelist_node.appendChildElement("Style")
    CALL style_node.setAttribute("name", m_data.widget)
    FOR i = 1 TO m_data.widget_style_arr.getLength()
        LET styleattribute_node = style_node.appendChildElement("StyleAttribute")
        CALL styleattribute_node.setAttribute("name", m_data.widget_style_arr[i].widget_style_attribute_name)
        CALL styleattribute_node.setAttribute("value", m_data.widget_style_arr[i].widget_style_attribute_value)
    END FOR

    -- .test Style
    LET style_node = stylelist_node.appendChildElement("Style")
    CALL style_node.setAttribute("name", ".test")
    FOR i = 1 TO m_data.common_style_arr.getLength()
        LET styleattribute_node = style_node.appendChildElement("StyleAttribute")
        CALL styleattribute_node.setAttribute("name", m_data.common_style_arr[i].common_style_attribute_name)
        CALL styleattribute_node.setAttribute("value", m_data.common_style_arr[i].common_style_attribute_value)
    END FOR
    CALL doc.save("styledemo_test.4st")
    RETURN stylelist_node.toString()
END FUNCTION
