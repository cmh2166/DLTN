<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/' xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    version="2.0" xmlns="http://www.loc.gov/mods/v3">
    <xsl:output omit-xml-declaration="yes" method="xml" encoding="UTF-8" indent="yes"/>
        
    <xsl:template match="text()|@*"/>    
    <xsl:template match="//oai_dc:dc">
        <mods xmlns:xlink="http://www.w3.org/1999/xlink" 
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
            xmlns="http://www.loc.gov/mods/v3" version="3.5" 
            xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
            <xsl:apply-templates select="dc:title"/> <!-- titleInfo/title and part/detail|date parsed out -->
            <xsl:apply-templates select="dc:identifier"/> <!-- identifier -->
            <xsl:apply-templates select="dc:contributor" /> <!-- name/role -->
            <xsl:apply-templates select="dc:creator" /> <!-- name/role -->
            
            <originInfo> 
                <xsl:apply-templates select="dc:date"/> <!-- date (text + key) -->
                <xsl:apply-templates select="dc:publisher"/> <!-- publisher NOT digital library -->
            </originInfo>
            
            <physicalDescription>
                <xsl:apply-templates select="dc:subject" mode="form"/> <!-- form and extent, note -->
            </physicalDescription>
            
            <location>
                <physicalLocation>Rhodes College</physicalLocation>
                <xsl:apply-templates select="dc:identifier" mode="URL"/> <!-- object in context URL -->
            </location>
            
            <xsl:apply-templates select="dc:language"/> <!-- language -->
            <xsl:apply-templates select="dc:description"/> <!-- abstract -->
            <xsl:apply-templates select="dc:relation" /> <!-- note, primarily season note -->
            <xsl:apply-templates select="dc:rights"/> <!-- accessCondition -->
            <xsl:apply-templates select="dc:date" mode="rights"/> <!-- some stray rights statements -->
            <xsl:apply-templates select="dc:subject"/> <!-- all genre/form terms, mapped as such -->
            <xsl:apply-templates select="dc:coverage"/> <!-- temporal and geographic subject info -->
            <xsl:apply-templates select="dc:subject" mode="type"/> <!-- typeOfResource -->
            <xsl:apply-templates select="dc:type"/> <!-- typeOfResource -->
            <xsl:apply-templates select="dc:title" mode="seriesTitle"/>
            <relatedItem type='host' displayLabel="Project">
                <titleInfo>
                    <title>McCoy Theatre Productions 1982-</title>
                </titleInfo>
                <location>
                    <url>https://dlynx.rhodes.edu/jspui/handle/10267/5853</url>
                </location>
            </relatedItem>
            <recordInfo>
                <recordContentSource>Rhodes College</recordContentSource>
                <xsl:apply-templates select="dc:date" mode="timestamp" /> <!-- Record creation dates mixed in with item creation dates -->
                <recordChangeDate><xsl:value-of select="current-date()"/></recordChangeDate>
                <languageOfCataloging>
                    <languageTerm type="code" authority="iso639-2b">eng</languageTerm>
                </languageOfCataloging>
                <recordOrigin>Record has been transformed into MODS 3.5 from a qualified Dublin Core record by the Digital Library of Tennessee, a service hub of the Digital Public Library of America, using a stylesheet available at https://github.com/cmh2166/DLTN. Metadata originally created in a locally modified version of qualified Dublin Core using DSpace (data dictionary available: https://wiki.lib.utk.edu/display/DPLA/Crossroads+Mapping+Notes.)</recordOrigin>
            </recordInfo>
        </mods>
    </xsl:template>
    
    <xsl:template match="dc:title">
        <xsl:if test="normalize-space(.)!=''">
            <titleInfo>
                <title><xsl:value-of select="normalize-space(.)"/></title>
            </titleInfo>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:title" mode="seriesTitle">
        <xsl:choose>
            <xsl:when test="normalize-space(.)!='' and starts-with(normalize-space(lower-case(.)), 'rhodes college today')">
                <relatedInfo type="preceding">
                    <title>Southwestern Today</title>
                </relatedInfo>
                <relatedInfo type="succeeding">
                    <title>Rhodes</title>
                </relatedInfo>
            </xsl:when>
            <xsl:when test="normalize-space(.)!='' and starts-with(normalize-space(lower-case(.)), 'rhodes')">
                <relatedInfo type="preceding">
                    <title>Rhodes Today</title>
                </relatedInfo>
            </xsl:when>
            <xsl:when test="normalize-space(.)!='' and starts-with(normalize-space(lower-case(.)), 'southwestern alumni')">
                <relatedInfo type="succeeding">
                    <title>Southwestern News</title>
                </relatedInfo>
            </xsl:when>
            <xsl:when test="normalize-space(.)!='' and starts-with(normalize-space(lower-case(.)), 'southwestern news')">
                <relatedInfo type="preceding">
                    <title>Southwestern Alumni</title>
                </relatedInfo>
                <relatedInfo type="succeeding">
                    <title>Southwestern Today</title>
                </relatedInfo>
            </xsl:when>
            <xsl:when test="normalize-space(.)!='' and starts-with(normalize-space(lower-case(.)), 'southwestern today')">
                <relatedInfo type="preceding">
                    <title>Southwestern News</title>
                </relatedInfo>
                <relatedInfo type="succeeding">
                    <title>Rhodes Today</title>
                </relatedInfo>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="dc:contributor">
        <xsl:if test="normalize-space(.)!='' and lower-case(normalize-space(.)) != 'season 10'">
            <xsl:choose>
                <xsl:when test="contains(normalize-space(.), 'Musical director')">
                    <name>
                        <namePart>
                            <xsl:value-of select="replace(., '--Musical director', '')"/>
                        </namePart>
                        <role>
                            <roleTerm type="text" valueURI="http://id.loc.gov/vocabulary/relators/msd">
                                <xsl:text>Musical director</xsl:text>
                            </roleTerm>
                        </role> 
                    </name>
                </xsl:when>
                <xsl:otherwise>
                    <name>
                        <namePart>
                            <xsl:value-of select="normalize-space(.)"/>
                        </namePart>
                        <role>
                            <roleTerm type="text" valueURI="http://id.loc.gov/vocabulary/relators/ctb">
                                <xsl:text>Contributor</xsl:text>
                            </roleTerm>
                        </role> 
                    </name>
                </xsl:otherwise>
            </xsl:choose>          
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:coverage">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
                <!-- check to see if there are any numbers in this coverage value -->
                <xsl:when test='matches(.,"\d+")'>
                    <xsl:choose>
                        <!-- if numbers follow a coordinate pattern, it's probably geo data - which should go in cartographics/coordinates child element -->
                        <xsl:when test='matches(.,"\d+\.\d+")'>
                            <subject>
                                <cartographics>
                                    <coordinates><xsl:value-of select="normalize-space(.)"/></coordinates>
                                </cartographics>
                            </subject>
                        </xsl:when>
                        <!-- if there's no coordinate pattern, it's probably temporal data; put it in temporal -->
                        <xsl:otherwise>
                            <subject>
                                <temporal><xsl:value-of select="normalize-space(.)"/></temporal>
                            </subject>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- if there are no numbers, it's probably geo data as text. one def option is Memphis, Tennessee --> 
                <xsl:when test="matches(normalize-space(.), '1970s')">
                    <subject>
                        <temporal encoding="edtf">1970/1979</temporal>
                    </subject>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="contains(., 'Memphis, Tennessee')">
                            <subject>
                                <geographic authority="lcnaf" valueURI="http://id.loc.gov/authorities/names/n78095779">Memphis (Tenn.)</geographic>
                                <cartographics>
                                    <coordinates>35.14953, -90.04898</coordinates>
                                </cartographics>
                            </subject>
                        </xsl:when>
                        <xsl:otherwise>
                            <subject>
                                <geographic><xsl:value-of select="normalize-space(.)"/></geographic>
                            </subject>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template> 
    
    <xsl:template match="dc:creator">
        <xsl:variable name="creatorvalue" select="normalize-space(.)"/>
        <xsl:if test="normalize-space(.)!='' and lower-case(normalize-space(.)) != 'n/a'">
            <xsl:choose>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'photographer')">
                    <name>
                        <namePart><xsl:value-of select="replace(normalize-space(.), ', photographer', '')"/></namePart>
                        <role>
                            <roleTerm type="text" valueURI="http://id.loc.gov/vocabulary/relators/pht">
                                <xsl:text>Photographer</xsl:text>
                            </roleTerm>
                        </role>
                    </name> 
                </xsl:when>
                <xsl:otherwise>
                    <name>
                        <namePart>
                            <xsl:value-of select="normalize-space(.)"/>
                        </namePart>
                        <role>
                            <roleTerm type="text" valueURI="http://id.loc.gov/vocabulary/relators/cre">
                                <xsl:text>Creator</xsl:text>
                            </roleTerm>
                        </role>
                    </name> 
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>          
    </xsl:template>
    
    <xsl:template match="dc:date"> 
        <xsl:if test="normalize-space(.)!='' and not(matches(normalize-space(.), '^\d{4}-\d{2}-\d{2}T.'))">
            <xsl:choose>
                <xsl:when test="contains(lower-case(.), 'unknown') or contains(lower-case(.), 'undated')">
                    <dateCreated encoding="edtf" keyDate="yes">uuuu</dateCreated>
                    <dateCreated><xsl:value-of select="normalize-space(.)"/></dateCreated>
                </xsl:when>
                <xsl:when test="matches(normalize-space(.), '^\d{4}$') or matches(normalize-space(.), '^\d{4}-\d{2}$') or matches(normalize-space(.), '^\d{4}-\d{2}-\d{2}$')">
                    <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="."/></dateCreated>
                    <dateCreated><xsl:value-of select="normalize-space(.)"/></dateCreated>
                </xsl:when>
                <!--here be dragons, dude-->
                <xsl:when test="matches(normalize-space(.), '^\d{2}-\d{2}-\d{4}$') or matches(normalize-space(.), '^\d{2}/\d{2}/\d{4}$')">
                    <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(concat(substring(.,7, 10),'-'), substring(., 1, 5))"/></dateCreated>
                    <dateCreated><xsl:value-of select="normalize-space(.)"/></dateCreated>
                </xsl:when>
                <xsl:when test="matches(normalize-space(.), '^\d{1}-\d{2}-\d{4}$') or matches(normalize-space(.), '^\d{1}/\d{2}/\d{4}$')">
                    <dateCreated encoding="edtf" keyDate="yes"><xsl:value-of select="concat(concat(substring(.,6, 9),'-'), substring(., 1, 4))"/></dateCreated>
                    <dateCreated><xsl:value-of select="normalize-space(.)"/></dateCreated>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:date" mode="rights">
        <xsl:if test="contains(normalize-space(.),'Rhodes College owns')">
            <accessCondition type="use and reproduction">
                <xsl:value-of select="normalize-space(.)"/>
            </accessCondition>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:date" mode="timestamp">
        <xsl:if test="matches(normalize-space(.),'^\d{4}-\d{2}-\d{2}T.')">
            <recordCreationDate><xsl:value-of select="normalize-space(.)"/></recordCreationDate>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:description">
        <xsl:if test="normalize-space(.)!='' and not(contains(normalize-space(lower-case(.)), 'born digital'))">
            <abstract><xsl:value-of select="normalize-space(.)"/></abstract>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:identifier">
        <xsl:if test="normalize-space(.)!=''">
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
        <xsl:if test="normalize-space(.)!='' and normalize-space(lower-case(.))!='other'">
            <language>
                <xsl:choose>
                    <xsl:when test="contains(normalize-space(lower-case(.)), 'en') or contains(normalize-space(lower-case(.)), 'english') or contains(normalize-space(lower-case(.)), 'englsih') or contains(normalize-space(lower-case(.)), 'enlish')">
                        <languageTerm type="code" authority="iso639-2b">eng</languageTerm>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space(lower-case(.)), 'de')">
                        <languageTerm type="code" authority="iso639-2b">ger</languageTerm>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space(lower-case(.)), 'fr')">
                        <languageTerm type="code" authority="iso639-2b">fre</languageTerm>
                    </xsl:when>
                    <xsl:otherwise>
                        <languageTerm type="text" authority="iso639-2b"><xsl:value-of select="normalize-space(.)"/></languageTerm>
                    </xsl:otherwise>
                </xsl:choose>
            </language>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:publisher"> 
        <xsl:if test="normalize-space(.)!='' and not(contains(lower-case(normalize-space(dc:publisher)),'dc:publisher'))">
            <xsl:choose>
                <xsl:when test="contains(normalize-space(lower-case(.)), ':')">
                    <xsl:for-each select="tokenize(normalize-space(.), ':')">
                        <xsl:choose>
                            <xsl:when test="contains(normalize-space(lower-case(.)), 'tenn.')">
                                <place><xsl:value-of select="normalize-space(.)"/></place>
                            </xsl:when>
                            <xsl:otherwise>
                                <publisher><xsl:value-of select="normalize-space(.)"/></publisher>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <publisher><xsl:value-of select="normalize-space(.)"/></publisher>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>            
    </xsl:template>
    
    <xsl:template match="dc:relation">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:if test="normalize-space(.)!=''">
                <xsl:choose>
                    <xsl:when test="contains(normalize-space(lower-case(.)), 'season')">
                        <note type="season"><xsl:value-of select="concat('McCoy Theatre, ', normalize-space(.))"/></note>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space(lower-case(.)), 'mccoy')">
                        <!-- skip the mccoy theatre statement since covered above and collection name -->
                    </xsl:when>
                    <xsl:otherwise>
                        <note><xsl:value-of select="normalize-space(.)"/></note>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="dc:rights">
        <xsl:choose>
            <xsl:when test="matches(normalize-space(.),'^Public domain\.$') or matches(normalize-space(.),'^Public Domain$') or matches(normalize-space(.),'^Public Domain\.$')">
                <accessCondition type="use and reproduction">Public domain</accessCondition>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space(.)!=''">
                    <accessCondition type="use and reproduction"><xsl:value-of select="normalize-space(.)"/></accessCondition>
                </xsl:if>     
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="dc:subject">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
                <xsl:when test="matches(normalize-space(.), '^\d{4}$')">
                    <subject>
                        <temporal encoding="edtf"><xsl:value-of select="normalize-space(.)"/></temporal>
                    </subject>
                </xsl:when>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'playbill')">
                    <genre authority="aat" valueURI="http://vocab.getty.edu/aat/300027216">playbills</genre>
                </xsl:when>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'poster')">
                    <genre authority="aat" valueURI="http://vocab.getty.edu/aat/300027221">posters</genre>
                </xsl:when>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'program')">
                    <genre authority="aat" valueURI="http://vocab.getty.edu/aat/300027240">programs (documents)</genre>
                </xsl:when>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'text')">
                    <genre authority="aat" valueURI="http://vocab.getty.edu/aat/300263751">texts (document genres)</genre>
                </xsl:when>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'image')">
                    <genre authority="aat" valueURI="http://vocab.getty.edu/aat/300264387">images (object genre)</genre>
                </xsl:when>
                <xsl:when test="matches(normalize-space(lower-case(.)), 'mccoy theatre')">
                    <subject>
                        <namePart>
                            <name>McCoy Theatre</name>
                        </namePart>
                    </subject>
                </xsl:when>
                <xsl:when test="matches(normalize-space(lower-case(.)), 'theatre productions')">
                    <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85134542">
                        <topic>Theater--Production and direction</topic>
                    </subject>
                </xsl:when>
                <xsl:when test="matches(normalize-space(lower-case(.)), 'musicals')">
                    <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85089018">
                        <topic>Musicals</topic>
                    </subject>
                </xsl:when>
                <xsl:otherwise>
                    <subject>
                        <topic><xsl:value-of select="normalize-space(.)"/></topic>
                    </subject>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:subject" mode="form">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:if test="contains(normalize-space(lower-case(.)), 'playbill') or contains(normalize-space(lower-case(.)), 'poster') or contains(normalize-space(lower-case(.)), 'program')">
                <form>normalize-space(lower-case(.)</form>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:subject" mode="type">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'text')">
                    <typeOfResource>text</typeOfResource>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="dc:type">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'image')">
                    <typeOfResource>still image</typeOfResource>
                </xsl:when>
                <xsl:when test="contains(normalize-space(lower-case(.)), 'other')">
                    <!-- do not map -->
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
