<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:variable name="Lower" 
        select="'abcdefgijklmnopqrstuvwxyz'"/>
    <xsl:variable name="Upper" 
        select="'ABCDEFGIJKLMNOPQRSTUVWXYZ'"/>
    
    
    <!-- lookup tables for most common AAT genre terms/URIs -->
    <xsl:template name="LCSHtopic">
        <xsl:param name="term"/>
        <xsl:variable name="topic" select="normalize-space(lower-case($term))"/>
        <xsl:choose>
            <xsl:when test="matches($topic, 'advertisements')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85001086">
                    <topic>Advertising</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'aerial photographs')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85001253">
                    <topic>Aerial photographs</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'architects')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85006565">
                    <topic>Architects</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'architecture')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85006611">
                    <topic>Architecture</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'architectural drawings')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh99001531">
                    <topic>Designs and plans</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'automobiles')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85010201">
                    <topic>Automobiles</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'barns')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85011902">
                    <topic>Barns</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'bridges')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85016829">
                    <topic>Bridges</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'buildings')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85017769">
                    <topic>Buildings</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'business enterprises')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85018285">
                    <topic>Business enterprises</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'children')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85023418">
                    <topic>Children</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'civil wars')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85026421">
                    <topic>Civil war</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'clippings')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85027084">
                    <topic>Clippings (Books, newspapers, etc.)</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'construction')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85017693">
                    <topic>Building</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'events')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh98005772">
                    <topic>Special events</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'fairs')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85046910">
                    <topic>Fairs</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'families')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85047009">
                    <topic>Families</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'flags')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85048969">
                    <topic>Flags</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'furnishings')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85062549">
                    <topic>House furnishings</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'great smoky mountains')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85057008">
                    <geographic>Great Smoky Mountains (N.C. and Tenn.)</geographic>
                    <cartographics>
                        <coordinates>35.58343, -83.50822</coordinates>
                    </cartographics>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'group portraits')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85105203">
                    <topic>Portraits, Group</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'history')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85061212">
                    <topic>History</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'horses')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85062160">
                    <topic>Horses</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'hotels')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85062487">
                    <topic>Hotels</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'houses')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85040193">
                    <topic>Dwellings</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'military uniforms')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85139693">
                    <topic>Military uniforms</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'parades') and contains(., 'processions')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85097741">
                    <topic>Parades</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'plans')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85006587">
                    <topic>Architectural drawing</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'politicians')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85104461">
                    <topic>Politicians</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'politics') and contains($topic, 'government')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh2002011436">
                    <topic>Politics</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'politics')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh2002011436">
                    <topic>Politics</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'portraits')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85105182">
                    <topic>Portraits</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'presidents')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85106459">
                    <topic>Presidents</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'scrapbooks')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85118923">
                    <topic>Scrapbooks</topic>
                </subject>
            </xsl:when>
            <xsl:when test="$topic='schools'">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85118451">
                    <topic>Schools</topic>
                </subject>
            </xsl:when>
            <xsl:when test="$topic='school children'">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85118295">
                    <topic>School children</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'snow')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85123771">
                    <topic>Snow</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'streets')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85128633">
                    <topic>Streets</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'telegrams')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85133315">
                    <topic>Telegraph</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'trucks')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85138148">
                    <topic>Trucks</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'uniforms')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85139691">
                    <topic>Uniforms</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'universities') and contains(., 'colleges')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85141086">
                    <topic>Universities and colleges</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'waterfalls')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85145720">
                    <topic>Waterfalls</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'women') and contains(., 'suffrage')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85147346">
                    <topic>Women--Suffrage</topic>
                </subject>
            </xsl:when>
            <xsl:when test="contains($topic, 'women') and contains(., 'rights')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85147765">
                    <topic>Women's rights</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'women')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85147274">
                    <topic>Women</topic>
                </subject>
            </xsl:when>
            <xsl:when test="matches($topic, 'views')">
                <subject authority="lcsh" valueURI="http://id.loc.gov/authorities/subjects/sh85143317">
                    <topic>Views</topic>
                </subject>
            </xsl:when>
            <xsl:otherwise>
                <subject>
                    <topic><xsl:value-of select="replace(replace(normalize-space(.), '\[', ''), '\]', '')"/></topic>
                </subject>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>