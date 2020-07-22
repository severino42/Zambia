<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- File created by Peter Olszowka July 16, 2020
Copyright (c) 2020 Peter Olszowka. All rights reserved. See copyright document for more details. -->
    <xsl:param name="showLinks" />
    <xsl:param name="now" />
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="not(/doc/query[@queryName='schedule']/row)">
                <div class="alert-info">No matching results found.</div>
            </xsl:when>
            <xsl:otherwise>
                <h4 class="alert alert-success center">Generated by Zambia: <xsl:value-of select="$now" /></h4>
                <p>If a room name and time are listed, then the session is on the schedule; otherwise, not.</p>
                <hr />
                <table class="table table-condensed">
                    <xsl:apply-templates select="doc/query[@queryName='schedule']/row" />
                </table>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="doc/query[@queryName='schedule']/row" >
        <tr>
            <td class="border0000" id="sessidtcell" style="font-weight:bold">
                <xsl:attribute name="rowspan">
                    <xsl:choose>
                        <xsl:when test="@persppartinfo">3</xsl:when>
                        <xsl:otherwise>2</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:if test="$showLinks">
                    <a>
                        <xsl:attribute name="href">StaffAssignParticipants.php?selsess=<xsl:value-of select="@sessionid" /></xsl:attribute>
                        <xsl:value-of select="@sessionid" />
                    </a>
                </xsl:if>
            </td>
            <td class="border0000" style="font-weight:bold"><xsl:value-of select="@trackname" /></td>
            <td class="border0000" style="font-weight:bold"><xsl:value-of select="@typename" /></td>
            <td class="border0000" style="font-weight:bold">
                <xsl:choose>
                    <xsl:when test="$showLinks">
                        <a>
                            <xsl:attribute name="href">EditSession.php?id=<xsl:value-of select="@sessionid" /></xsl:attribute>
                            <xsl:value-of select="@title" />
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@title" />
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="border0000" style="font-weight:bold"><xsl:value-of select="@duration" /></td>
            <td class="border0000" style="font-weight:bold">
                <xsl:choose>
                    <xsl:when test="@roomname">
                        <xsl:value-of select="@roomname" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="border0000" style="font-weight:bold">
                <xsl:choose>
                    <xsl:when test="@starttime">
                        <xsl:value-of select="@starttime" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td class="border0000" style="font-weight:bold"><xsl:value-of select="@statusname" /></td>
            <td class="border0000" style="font-weight:bold">
                <xsl:if test="$showLinks">
                    <a>
                        <xsl:attribute name="href">SessionHistory.php?selsess=<xsl:value-of select="@sessionid" /></xsl:attribute>
                        <xsl:text>History</xsl:text>
                    </a>
                </xsl:if>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="border0010"><xsl:value-of select="@taglist" /></td>
            <td colspan="6" class="border0010"><xsl:value-of select="@progguiddesc" /></td>
        </tr>
        <xsl:if test="@persppartinfo">
            <tr>
                <td />
                <td colspan="2" class="border0000">Prospective Participant Info: </td>
                <td colspan="6" class="border0000">
                    <span class="alert" style="padding: 0"><xsl:value-of select="@persppartinfo" /></span>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="border0020"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
            </tr>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>