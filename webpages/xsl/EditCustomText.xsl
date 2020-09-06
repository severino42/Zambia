<?xml version="1.0" encoding="UTF-8" ?>
<!--
	Created by Peter Olszowka on 2020-06-01;
	Copyright (c) 2020 Peter Olszowka. All rights reserved. See copyright document for more details.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="UpdateMessage" select="''"/>
  <xsl:param name="control" select="''"/>
  <xsl:param name="controliv" select="''"/>
  <xsl:param name="selected" select="''"/>
  <xsl:param name="initialtext" select="''"/>
  <xsl:output encoding="UTF-8" indent="yes" method="html" />
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$UpdateMessage != ''">
        <div class="alert alert-success">
          <xsl:value-of select="$UpdateMessage" disable-output-escaping="yes"/>
        </div>
      </xsl:when>
    </xsl:choose>
    <h2>Custom Text Entries</h2>
    <form name="customtextform" class="form-horizontal" method="POST" action="EditCustomText.php">
    <input type="hidden" id="PostCheck" name="PostCheck" value="POST"/>
    <input type="hidden" id="control" name="control" value="{$control}" />
    <input type="hidden" id="controliv" name="controliv" value="{$controliv}" />
    <xsl:for-each select="/doc/query[@queryName='custom_text']/row">
      <input type="hidden" name="t{@customtextid}" id="t{@customtextid}" value="{@textcontents}"></input>
    </xsl:for-each>

    <div id="select_custom_text_item" class="control-group">
      <label for="custom_text_item" class="control-label">Entry to edit:</label>
      <div class="controls">
        <select id="customtextid" name="customtextid" class="span4">
          <xsl:if test="$selected = ''">
            <option value="-1">
              Select entry to edit
            </option>
          </xsl:if>
          <xsl:for-each select="/doc/query[@queryName='custom_text']/row">
            <option value="{@customtextid}">
              <xsl:if test="@customtextid = $selected">
                <xsl:attribute name="selected">selected</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="@page"/>
              <xsl:text>&#160;-&gt;&#160;</xsl:text>
              <xsl:value-of select="@tag"/>
            </option>
          </xsl:for-each>
        </select>
      </div>
    </div>
    <div id="texteditor" class="control-group">
      <xsl:if test="$selected = ''">
        <xsl:attribute name="style">display: none;</xsl:attribute>
      </xsl:if>
      <label for="custom_text" class="control-label">Custom Text</label>
      <div class="controls">
        <textarea id="textcontents" name="textcontents" rows="15" style="width: 90%">
          <xsl:value-of select="$initialtext"/>
        </textarea>
      </div>
    </div>
    <div id="buttonBox" class="clearfix">
      <div class="pull-right">
        <button class="btn" id="resetbtn" name="resetbtn" value="undo" type="button">Reset</button>
        <button class="btn btn-primary" id="submitbtn" name="submitbtn" type="submit" value="save" onclick="SaveTextaarea()">Save</button>
      </div>
    </div>
  </form>
  </xsl:template>
</xsl:stylesheet>