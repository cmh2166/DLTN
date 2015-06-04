<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/' xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    version="2.0" xmlns="http://www.loc.gov/mods/v3">
    <xsl:output omit-xml-declaration="yes" method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- OAI-DC to MODS Core Transformations. Includes the following templates:
        dc:date
        dc:description
        dc:identifier
        dc:identifier mode=URL
        dc:language
        dc:rights
        dc:title
    -->
    
    <xsl:template match="dc:date"> 
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:if test="normalize-space(.)!=''">
                <xsl:choose>
                  <!-- DIRECT EDTF MATCHES -->
                    <xsl:when test="matches(normalize-space(.), '^\d{4}$') or matches(normalize-space(.), '^\d{4}-\d{2}$') or matches(normalize-space(.), '^\d{4}-\d{2}-\d{2}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="."/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(normalize-space(.), '^\d{4}-\d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="replace(normalize-space(.), '-', '/')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(normalize-space(.), '^\d{4} - \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="replace(normalize-space(.), ' - ', '/')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="normalize-space(lower-case(.))!='unknown' and normalize-space(lower-case(.))!='uknown'">
                        <dateCreated encoding="edtf" keyDate="yes">uuuu</dateCreated>
                    </xsl:when>
                  <!-- DATE RANGES -->
                    <xsl:when test="matches(normalize-space(.), '^\d{4}-\d{2}-\d{2} to \d{4}-\d{2}-\d{2}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="replace(normalize-space(.), ' to ', '/')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(normalize-space(.), '^\d{4}-\d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="replace(normalize-space(.), '-', '/')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(normalize-space(.), '^\d{4} - \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="replace(normalize-space(.), ' - ', '/')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(normalize-space(.), '^\d{4}s$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(concat(replace(normalize-space(.), 's', ''), '/'), replace(normalize-space(.), '0s', '9'))"/></dateCreated>
                    </xsl:when>
                  <!-- Match Month YYYY formatting -->
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^january \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-01')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^february \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-02')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^march \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-03')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^april \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-04')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^may \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-05')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^june \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-06')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^july \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-07')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^august \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-08')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^september \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-09')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^october \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-10')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^november \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-11')"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^december \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ' ')), '-12')"/></dateCreated>
                    </xsl:when>
                  <!-- Match Month DD, YYYY formatting -->
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^january \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'january ', '-01-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^january \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'january ', '-01-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^february \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'february ', '-02-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^february \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'february ', '-02-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^march \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'march ', '-03-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^march \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'march ', '-03-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^april \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'april ', '-04-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^april \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'april ', '-04-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^may \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'may ', '-05-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^may \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'may ', '-05-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^june \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'june ', '-06-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^june \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'june ', '-06-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^july \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'july ', '-07-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^july \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'july ', '-07-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^august \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'august ', '-08-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^august \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'august ', '-08-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^september \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'september ', '-09-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^september \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'september ', '-09-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^october \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'october ', '-10-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^october \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'october ', '-10-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^november \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'november ', '-11-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^november \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'november ', '-11-'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^december \d{1}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'december ', '-12-0'))"/></dateCreated>
                    </xsl:when>
                    <xsl:when test="matches(lower-case(normalize-space(.)), '^december \d{2}, \d{4}$')">
                        <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(normalize-space(lower-case(.)), ', ')), replace(replace(substring-before(normalize-space(lower-case(.)), ','), ',', ''), 'december ', '-12'))"/></dateCreated>
                    </xsl:when>
                  <!-- INFERRED -->
                    <xsl:when test="contains(normalize-space(lower-case(.)), '\[')">
                        <xsl:choose>
                            <xsl:when test="matches(normalize-space(.), '^\[\d{4}-\d{2}-\d{2}\]$') or matches(normalize-space(.), '^\[\d{4}-\d{2}\]$') or matches(normalize-space(.), '^\[\d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="translate(normalize-space(.), '\[\]', '')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(normalize-space(.), '^\[\d{4}\]\?$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(translate(normalize-space(.), '\[\]', ''), '?')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(normalize-space(.), '^\[\d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(translate(normalize-space(.), '\[\]', ''), '?')"/></dateCreated>
                            </xsl:when>
                          <!-- Match [Month YYYY] formatting -->
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[january \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-01')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[february \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-02')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[march \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-03')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[april \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-04')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[may \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-05')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[june \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-06')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[july \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-07')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[august \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-08')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[september \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-09')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[october \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-10')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[november \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-11')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(lower-case(normalize-space(.)), '^\[december \d{4}\]$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(normalize-space(substring-after(lower-case(translate(normalize-space(.), '\[\]', '')), ' ')), '-12')"/></dateCreated>
                            </xsl:when>
                            <xsl:otherwise>
                                <dateCreated ><xsl:value-of select="normalize-space(.)"/></dateCreated>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                  <!-- QUESTIONABLE -->
                    <!-- to be filled in -->
                  <!-- APPROXIMATE -->
                    <xsl:when test="contains(normalize-space(lower-case(.)), 'circa') or contains(normalize-space(lower-case(.)), 'c.') or contains(normalize-space(lower-case(.)), 'ca.')">
                        <xsl:choose>
                            <xsl:when test="matches(normalize-space(.), '^c. \d{4}$') or matches(normalize-space(.), '^c. \d{4}-\d{2}$') or matches(normalize-space(.), '^c. \d{4}-\d{2}-\d{2}$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(replace(normalize-space(.), 'c. ', ''), '~')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(normalize-space(.), '^c. \d{4}-\d{4}$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(concat(concat(substring(normalize-space(.),1, 4),'/'), substring(., 6, 8)), '~')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(normalize-space(.), '^ca. \d{4}$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(replace(normalize-space(.), 'ca. ', ''), '~')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(normalize-space(.), '^c.\d{4}$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(replace(normalize-space(.), 'c.', ''), '~')"/></dateCreated>
                            </xsl:when>
                            <xsl:when test="matches(normalize-space(.), '^c. \d{4}s$')">
                                <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(concat(concat(replace(replace(normalize-space(.), 'c. ', ''), 's', ''), '~'), '/'), concat(replace(replace(normalize-space(.), 'c. ', ''), '0s', '9'), '~'))"/></dateCreated>
                            </xsl:when>
                            <xsl:otherwise>
                                <dateCreated qualifier="approximate"><xsl:value-of select="normalize-space(.)"/></dateCreated>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <dateCreated><xsl:value-of select="normalize-space(.)"/></dateCreated>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="dc:description[1]"> <!-- second abstract skipped bc bad OCR texts - need to review further -->
        <xsl:if test="normalize-space(.)!=''">
            <abstract><xsl:value-of select="normalize-space(.)"/></abstract>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!='' and not(starts-with(., 'http://'))">
            <identifier><xsl:value-of select="normalize-space(.)"/></identifier>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:identifier" mode="URL">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:if test="starts-with(., 'http://')">
                <url usage="primary" access="object in context"><xsl:value-of select="normalize-space(.)"/></url>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:language">
        <xsl:for-each select="tokenize(normalize-space(lower-case(.)), ';')">
            <xsl:for-each select="tokenize(normalize-space(.), ' &amp; ')">
                <xsl:if test="normalize-space(.)!=''">
                    <language>
                        <xsl:choose>
                            <xsl:when test="contains(normalize-space(lower-case(.)), 'english') or contains(normalize-space(lower-case(.)), 'englsih')">
                                <languageTerm type="code" authority="iso639-2b">eng</languageTerm>
                            </xsl:when>
                            <xsl:when test="contains(normalize-space(lower-case(.)), 'dutch')">
                                <languageTerm type="code" authority="iso639-2b">dut</languageTerm>
                            </xsl:when>
                            <xsl:when test="contains(normalize-space(lower-case(.)), 'french')">
                                <languageTerm type="code" authority="iso639-2b">fre</languageTerm>
                            </xsl:when>
                            <xsl:when test="normalize-space(lower-case(.))='german'">
                                <languageTerm type="code" authority="iso639-2b">deu</languageTerm>
                            </xsl:when>
                            <xsl:when test="normalize-space(lower-case(.))='italian'">
                                <languageTerm type="code" authority="iso639-2b">ita</languageTerm>
                            </xsl:when>
                            <xsl:when test="normalize-space(lower-case(.))='spanish'">
                                <languageTerm type="code" authority="iso639-2b">spa</languageTerm>
                            </xsl:when>
                        </xsl:choose>
                    </language>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="dc:rights">
        <xsl:choose>
            <xsl:when test="matches(normalize-space(.),'^Public domain\.$') or matches(normalize-space(.),'^Public Domain$') or matches(normalize-space(.),'^Public Domain\.$')">
                <accessCondition>Public domain</accessCondition>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space(.)!=''">
                    <accessCondition><xsl:value-of select="normalize-space(.)"/></accessCondition>
                </xsl:if>     
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="dc:title">
        <xsl:if test="normalize-space(.)!=''">
            <titleInfo>
                <title><xsl:value-of select="normalize-space(.)"/></title>
            </titleInfo>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>