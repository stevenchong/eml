<?xml version="1.0"?>
<!--
  *  '$RCSfile: eml-software-2.0.0.xsl,v $'
  *      Authors: Matt Jones
  *    Copyright: 2000 Regents of the University of California and the
  *               National Center for Ecological Analysis and Synthesis
  *  For Details: http://www.nceas.ucsb.edu/
  *
  *   '$Author: berkley $'
  *     '$Date: 2004-07-20 21:41:45 $'
  * '$Revision: 1.1.2.1 $'
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  *
  * This is an XSLT (http://www.w3.org/TR/xslt) stylesheet designed to
  * convert an XML file that is valid with respect to the eml-dataset.dtd
  * module of the Ecological Metadata Language (EML) into an HTML format
  * suitable for rendering with modern web browsers.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


  <xsl:output method="html" encoding="iso-8859-1"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
              doctype-system="http://www.w3.org/TR/html4/loose.dtd"
              indent="yes" />  

  <xsl:template name="software">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:param name="softwaresubHeaderStyle"/>
    <table xsl:use-attribute-sets="cellspacing" class="{$tabledefaultStyle}" width="100%">
        <xsl:choose>
         <xsl:when test="references!=''">
          <xsl:variable name="ref_id" select="references"/>
          <xsl:variable name="references" select="$ids[@id=$ref_id]" />
          <xsl:for-each select="$references">
            <xsl:call-template name="softwarecommon">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="softwarecommon">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
            </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>

  <xsl:template name="softwarecommon">
        <xsl:param name="softwarefirstColStyle"/>
        <xsl:param name="softwaresubHeaderStyle"/>
        <tr><td class="{$softwaresubHeaderStyle}" colspan="2">
        <xsl:text>Software:</xsl:text></td></tr>
        <xsl:call-template name="resource">
           <xsl:with-param name="resfirstColStyle" select="$softwarefirstColStyle"/>
           <xsl:with-param name="ressubHeaderStyle" select="$softwaresubHeaderStyle"/>
           <xsl:with-param name="creator">Author(s):</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="implementation">
           <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
           <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
         <xsl:for-each select="dependency">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Dependency
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                 &#160;
                </td>
           </tr>
           <xsl:call-template name="dependency">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
           </xsl:call-template>
        </xsl:for-each>
        <xsl:call-template name="licenseURL">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
        <xsl:call-template name="license">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
        <xsl:call-template name="version">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
        <xsl:call-template name="softwareAccess">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
        <xsl:call-template name="softwareProject">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
  </xsl:template>

  <xsl:template name="implementation">
     <xsl:param name="softwarefirstColStyle"/>
     <xsl:param name="softwaresubHeaderStyle"/>
     <xsl:for-each select="implementation">
        <tr><td colspan="2" class="{$softwaresubHeaderStyle}">
             Implementation Info:
            </td>
        </tr>
        <xsl:for-each select="distribution">
           <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
             Distribution:
            </td>
            <td width="{$secondColWidth}">
               <xsl:call-template name="distribution">
                 <xsl:with-param name="disfirstColStyle" select="$softwarefirstColStyle"/>
                 <xsl:with-param name="dissubHeaderStyle" select="$softwaresubHeaderStyle"/>
               </xsl:call-template>
            </td>
        </tr>
        </xsl:for-each>
        <xsl:for-each select="size">
           <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
             Size:
            </td>
            <td width="{$secondColWidth}" class="{$secondColStyle}">
             <xsl:value-of select="."/>
            </td>
        </tr>
        </xsl:for-each>
        <xsl:for-each select="language">
           <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Language:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="LanguageValue"/>
                </td>
           </tr>
           <xsl:if test="LanguageCodeStandard">
             <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Language Code Standard:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="LanguageValue"/>
                </td>
             </tr>
           </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="operatingSystem">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Operating System:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
        <xsl:for-each select="machineProcessor">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Operating System:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
        <xsl:for-each select="virtualMachine">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Virtual Machine:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
         <xsl:for-each select="diskUsage">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Disk Usage:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
        <xsl:for-each select="runtimeMemoryUsage">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Run Time Memory Usage:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
        <xsl:for-each select="programmingLanguage">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Programming Language:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
        <xsl:for-each select="checksum">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Check Sum:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                  <xsl:value-of select="."/>
                </td>
           </tr>
        </xsl:for-each>
        <xsl:for-each select="dependency">
          <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
                Dependency:
                </td>
                <td width="{$secondColWidth}" class="{$secondColStyle}">
                 &#160;
                </td>
           </tr>
           <xsl:call-template name="dependency">
              <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
              <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
           </xsl:call-template>
        </xsl:for-each>
     </xsl:for-each>
  </xsl:template>

  <xsl:template name="dependency">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:param name="softwaresubHeaderStyle"/>
    <xsl:for-each select="../dependency">
      <tr><td width="{$firstColWidth}" class="{$softwarefirstColStyle}">
           <b><xsl:value-of select="action"/></b> <xsl:text> Depend on</xsl:text>
        </td>
        <td width="{$secondColWidth}">
            <xsl:for-each select="software">
               <xsl:call-template name="software">
                  <xsl:with-param name="softwarefirstColStyle" select="$softwarefirstColStyle"/>
                  <xsl:with-param name="softwaresubHeaderStyle" select="$softwaresubHeaderStyle"/>
               </xsl:call-template>
            </xsl:for-each>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="version">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:for-each select="version">
        <tr><td width="{$firstColWidth}" class="{$firstColStyle}">
        Version Number:</td><td width="{$secondColWidth}" class="{$secondColStyle}">
        <xsl:value-of select="."/></td></tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="licenseURL">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:for-each select="licenseURL">
        <tr><td width="{$firstColWidth}" class="{$firstColStyle}">
            License URL:</td><td width="{$secondColWidth}" class="{$secondColStyle}">
        <xsl:value-of select="."/></td></tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="license">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:for-each select="license">
        <tr><td width="{$firstColWidth}" class="{$firstColStyle}">
            License:</td><td width="{$secondColWidth}" class="{$secondColStyle}">
        <xsl:value-of select="."/></td></tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="softwareAccess">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:param name="softwaresubHeaderStyle"/>
    <xsl:for-each select="access">
      <tr><td colspan="2">
         <xsl:call-template name="access">
           <xsl:with-param name="accessfirstColStyle" select="$softwarefirstColStyle"/>
           <xsl:with-param name="accesssubHeaderStyle" select="$softwaresubHeaderStyle"/>
         </xsl:call-template>
         </td>
       </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="softwareProject">
    <xsl:param name="softwarefirstColStyle"/>
    <xsl:param name="softwaresubHeaderStyle"/>
    <xsl:for-each select="project">
      <tr><td class="{$softwaresubHeaderStyle}" colspan="2">
        <xsl:text>Project Info:</xsl:text></td></tr>
      <tr><td colspan="2">
        <xsl:call-template name="project">
          <xsl:with-param name="projectfirstColStyle" select="$softwarefirstColStyle"/>
          <xsl:with-param name="projectsubHeaderStyle" select="$softwaresubHeaderStyle"/>
        </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>