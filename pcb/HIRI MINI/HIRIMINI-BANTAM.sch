<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="1" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="1" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="1" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="1" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="1" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="1" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="1" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="1" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="1" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="1" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="1" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="1" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="1" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="LILYGOMINI">
<packages>
<package name="LILYGO-PADS">
<pad name="RST" x="-11.43" y="8.89" drill="0.9" diameter="1.143" shape="long"/>
<pad name="2" x="-11.43" y="6.35" drill="0.9" diameter="1.143" shape="long"/>
<pad name="4" x="-11.43" y="3.81" drill="0.9" diameter="1.143" shape="long"/>
<pad name="5" x="-11.43" y="1.27" drill="0.9" diameter="1.143" shape="long"/>
<pad name="6" x="-11.43" y="-1.27" drill="0.9" diameter="1.143" shape="long"/>
<pad name="7" x="-11.43" y="-3.81" drill="0.9" diameter="1.143" shape="long"/>
<pad name="10" x="-11.43" y="-6.35" drill="0.9" diameter="1.143" shape="long"/>
<pad name="3V3" x="-11.43" y="-8.89" drill="0.9" diameter="1.143" shape="long"/>
<pad name="TXD" x="11.43" y="8.89" drill="0.9" diameter="1.143" shape="long"/>
<pad name="RXD" x="11.43" y="6.35" drill="0.9" diameter="1.143" shape="long"/>
<pad name="SDA" x="11.43" y="3.81" drill="0.9" diameter="1.143" shape="long"/>
<pad name="SCL" x="11.43" y="1.27" drill="0.9" diameter="1.143" shape="long"/>
<pad name="9" x="11.43" y="-1.27" drill="0.9" diameter="1.143" shape="long"/>
<pad name="8" x="11.43" y="-3.81" drill="0.9" diameter="1.143" shape="long"/>
<pad name="GND" x="11.43" y="-6.35" drill="0.9" diameter="1.143" shape="long"/>
<pad name="5V" x="11.43" y="-8.89" drill="0.9" diameter="1.143" shape="long"/>
<wire x1="13.97" y1="13.91" x2="13.97" y2="-25.23" width="0.127" layer="21"/>
<wire x1="-13.97" y1="-25.23" x2="-13.97" y2="13.91" width="0.127" layer="21"/>
<rectangle x1="2.54" y1="-29.21" x2="10.16" y2="-21.59" layer="21"/>
<rectangle x1="-13.97" y1="-25.4" x2="-5.08" y2="-13.97" layer="21"/>
<text x="8.89" y="12.7" size="1.27" layer="21" rot="R180">LILYGO-D1MINI-PLUS</text>
<wire x1="13.97" y1="13.97" x2="11.43" y2="16.51" width="0.127" layer="21" curve="90"/>
<wire x1="11.43" y1="16.51" x2="-11.43" y2="16.51" width="0.127" layer="21"/>
<wire x1="-11.43" y1="16.51" x2="-13.97" y2="13.97" width="0.127" layer="21" curve="90"/>
<wire x1="-13.97" y1="-25.4" x2="-11.43" y2="-27.94" width="0.127" layer="21" curve="90"/>
<wire x1="-11.43" y1="-27.94" x2="11.43" y2="-27.94" width="0.127" layer="21"/>
<wire x1="11.43" y1="-27.94" x2="13.97" y2="-25.4" width="0.127" layer="21" curve="90"/>
<circle x="-11.43" y="13.97" radius="0.9684" width="0.127" layer="21"/>
<circle x="11.43" y="13.97" radius="0.9704625" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="LILYGO-PINS">
<wire x1="0" y1="0" x2="20.32" y2="0" width="0.254" layer="94"/>
<wire x1="20.32" y1="0" x2="20.32" y2="-10.16" width="0.254" layer="94"/>
<wire x1="20.32" y1="-10.16" x2="20.32" y2="-12.7" width="0.254" layer="94"/>
<wire x1="20.32" y1="-12.7" x2="20.32" y2="-15.24" width="0.254" layer="94"/>
<wire x1="20.32" y1="-15.24" x2="20.32" y2="-17.78" width="0.254" layer="94"/>
<wire x1="20.32" y1="-17.78" x2="20.32" y2="-20.32" width="0.254" layer="94"/>
<wire x1="20.32" y1="-20.32" x2="20.32" y2="-22.86" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-22.86" width="0.254" layer="94"/>
<wire x1="20.32" y1="-22.86" x2="0" y2="-22.86" width="0.254" layer="94"/>
<pin name="RST" x="-5.08" y="-2.54" length="middle"/>
<pin name="2" x="-5.08" y="-5.08" length="middle"/>
<pin name="4" x="-5.08" y="-7.62" length="middle"/>
<pin name="5" x="-5.08" y="-10.16" length="middle"/>
<pin name="6" x="-5.08" y="-12.7" length="middle"/>
<pin name="7" x="-5.08" y="-15.24" length="middle"/>
<pin name="10" x="-5.08" y="-17.78" length="middle"/>
<pin name="3V3" x="-5.08" y="-20.32" length="middle"/>
<pin name="TXD" x="25.4" y="-2.54" length="middle" rot="R180"/>
<pin name="RXD" x="25.4" y="-5.08" length="middle" rot="R180"/>
<pin name="19" x="25.4" y="-7.62" length="middle" rot="R180"/>
<pin name="18" x="25.4" y="-10.16" length="middle" rot="R180"/>
<pin name="9" x="25.4" y="-12.7" length="middle" rot="R180"/>
<pin name="8" x="25.4" y="-15.24" length="middle" rot="R180"/>
<pin name="GND" x="25.4" y="-17.78" length="middle" rot="R180"/>
<pin name="5V" x="25.4" y="-20.32" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LILYGOPLUSMINI">
<gates>
<gate name="LILYGO-D1MINI-PLUS" symbol="LILYGO-PINS" x="-7.62" y="12.7"/>
</gates>
<devices>
<device name="" package="LILYGO-PADS">
<connects>
<connect gate="LILYGO-D1MINI-PLUS" pin="10" pad="10"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="18" pad="SCL"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="19" pad="SDA"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="2" pad="2"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="3V3" pad="3V3"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="4" pad="4"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="5" pad="5"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="5V" pad="5V"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="6" pad="6"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="7" pad="7"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="8" pad="8"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="9" pad="9"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="GND" pad="GND"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="RST" pad="RST"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="RXD" pad="RXD"/>
<connect gate="LILYGO-D1MINI-PLUS" pin="TXD" pad="TXD"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ConectorPlantower">
<packages>
<package name="MOLEX_53048-0810">
<wire x1="-5.775" y1="-0.98" x2="-5.25" y2="-0.98" width="0.2032" layer="51"/>
<wire x1="5.25" y1="-0.98" x2="5.775" y2="-0.98" width="0.2032" layer="51"/>
<wire x1="5.775" y1="-0.98" x2="5.775" y2="4.395" width="0.2032" layer="51"/>
<wire x1="5.775" y1="4.395" x2="5.625" y2="4.395" width="0.2032" layer="51"/>
<wire x1="5.625" y1="4.395" x2="-5.625" y2="4.395" width="0.2032" layer="51"/>
<wire x1="-5.625" y1="4.395" x2="-5.775" y2="4.395" width="0.2032" layer="51"/>
<wire x1="-5.775" y1="4.395" x2="-5.775" y2="-0.98" width="0.2032" layer="51"/>
<wire x1="-5.75" y1="2.77" x2="-5.25" y2="2.77" width="0.0508" layer="51"/>
<wire x1="-5.25" y1="2.77" x2="-5" y2="2.77" width="0.0508" layer="51"/>
<wire x1="-5" y1="2.77" x2="-5" y2="1.895" width="0.0508" layer="51"/>
<wire x1="-5" y1="1.895" x2="5" y2="1.895" width="0.0508" layer="51"/>
<wire x1="5" y1="2.77" x2="5.25" y2="2.77" width="0.0508" layer="51"/>
<wire x1="5.25" y1="2.77" x2="5.75" y2="2.77" width="0.0508" layer="51"/>
<wire x1="5" y1="2.77" x2="5" y2="1.895" width="0.0508" layer="51"/>
<wire x1="-5.25" y1="0.27" x2="5.25" y2="0.27" width="0.2032" layer="51"/>
<wire x1="-4.625" y1="-0.23" x2="-4.75" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-3.375" y1="-0.23" x2="-3.5" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-3.5" y1="-0.355" x2="-4" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-4.125" y1="-0.23" x2="-4" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-2.125" y1="-0.23" x2="-2.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-0.355" x2="-2.75" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-2.875" y1="-0.23" x2="-2.75" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-0.875" y1="-0.23" x2="-1" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-1" y1="-0.355" x2="-1.5" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-1.625" y1="-0.23" x2="-1.5" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="0.375" y1="-0.23" x2="0.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="0.25" y1="-0.355" x2="-0.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-0.375" y1="-0.23" x2="-0.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="1.625" y1="-0.23" x2="1.5" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="1.5" y1="-0.355" x2="1" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="0.875" y1="-0.23" x2="1" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="2.875" y1="-0.23" x2="2.75" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="2.75" y1="-0.355" x2="2.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="2.125" y1="-0.23" x2="2.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="4.125" y1="-0.23" x2="4" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="4" y1="-0.355" x2="3.5" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="3.375" y1="-0.23" x2="3.5" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="5.25" y1="-0.355" x2="4.75" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="4.625" y1="-0.23" x2="4.75" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-4.75" y1="-0.355" x2="-5.25" y2="-0.355" width="0.2032" layer="51"/>
<wire x1="-5.75" y1="0.27" x2="-5.25" y2="0.27" width="0.2032" layer="51"/>
<wire x1="-5.25" y1="0.27" x2="-5.25" y2="-0.98" width="0.2032" layer="51"/>
<wire x1="5.25" y1="0.27" x2="5.75" y2="0.27" width="0.2032" layer="51"/>
<wire x1="5.25" y1="0.27" x2="5.25" y2="-0.98" width="0.2032" layer="51"/>
<wire x1="-5.25" y1="2.77" x2="-5.25" y2="4.02" width="0.0508" layer="51"/>
<wire x1="-5.25" y1="4.02" x2="5.25" y2="4.02" width="0.0508" layer="51"/>
<wire x1="5.25" y1="4.02" x2="5.25" y2="2.77" width="0.0508" layer="51"/>
<wire x1="-5.25" y1="4.02" x2="-5.625" y2="4.395" width="0.0508" layer="51"/>
<wire x1="5.25" y1="4.02" x2="5.625" y2="4.395" width="0.0508" layer="51"/>
<wire x1="-4.5" y1="2.77" x2="-4.375" y2="3.27" width="0.2032" layer="51"/>
<wire x1="-4.375" y1="3.27" x2="-4.25" y2="2.77" width="0.2032" layer="51"/>
<wire x1="-3.25" y1="2.77" x2="-3.125" y2="3.27" width="0.2032" layer="51"/>
<wire x1="-3.125" y1="3.27" x2="-3" y2="2.77" width="0.2032" layer="51"/>
<wire x1="-2" y1="2.77" x2="-1.875" y2="3.27" width="0.2032" layer="51"/>
<wire x1="-1.875" y1="3.27" x2="-1.75" y2="2.77" width="0.2032" layer="51"/>
<wire x1="-0.75" y1="2.77" x2="-0.625" y2="3.27" width="0.2032" layer="51"/>
<wire x1="-0.625" y1="3.27" x2="-0.5" y2="2.77" width="0.2032" layer="51"/>
<wire x1="0.5" y1="2.77" x2="0.625" y2="3.27" width="0.2032" layer="51"/>
<wire x1="0.625" y1="3.27" x2="0.75" y2="2.77" width="0.2032" layer="51"/>
<wire x1="1.75" y1="2.77" x2="1.875" y2="3.27" width="0.2032" layer="51"/>
<wire x1="1.875" y1="3.27" x2="2" y2="2.77" width="0.2032" layer="51"/>
<wire x1="3" y1="2.77" x2="3.125" y2="3.27" width="0.2032" layer="51"/>
<wire x1="3.125" y1="3.27" x2="3.25" y2="2.77" width="0.2032" layer="51"/>
<wire x1="4.25" y1="2.77" x2="4.375" y2="3.27" width="0.2032" layer="51"/>
<wire x1="4.375" y1="3.27" x2="4.5" y2="2.77" width="0.2032" layer="51"/>
<text x="-5.64621875" y="5.91628125" size="1.27028125" layer="25">&gt;NAME</text>
<text x="-5.37761875" y="-3.75183125" size="1.27061875" layer="27">&gt;VALUE</text>
<rectangle x1="-4.628209375" y1="-0.230159375" x2="-4.125" y2="0.27" layer="51"/>
<rectangle x1="-3.3801" y1="-0.230346875" x2="-2.875" y2="0.27" layer="51"/>
<rectangle x1="-2.12781875" y1="-0.23030625" x2="-1.625" y2="0.27" layer="51"/>
<rectangle x1="-0.8759625" y1="-0.230253125" x2="-0.375" y2="0.27" layer="51"/>
<rectangle x1="0.37534375" y1="-0.230209375" x2="0.875" y2="0.27" layer="51"/>
<rectangle x1="1.62708125" y1="-0.23029375" x2="2.125" y2="0.27" layer="51"/>
<rectangle x1="2.87673125" y1="-0.2301375" x2="3.375" y2="0.27" layer="51"/>
<rectangle x1="4.125609375" y1="-0.230034375" x2="4.625" y2="0.27" layer="51"/>
<rectangle x1="-4.6323" y1="1.897990625" x2="-4.125" y2="2.77" layer="51"/>
<rectangle x1="-3.37791875" y1="1.896640625" x2="-2.875" y2="2.77" layer="51"/>
<rectangle x1="-2.125809375" y1="1.89571875" x2="-1.625" y2="2.77" layer="51"/>
<rectangle x1="-0.875390625" y1="1.89585" x2="-0.375" y2="2.77" layer="51"/>
<rectangle x1="0.3754625" y1="1.89733125" x2="0.875" y2="2.77" layer="51"/>
<rectangle x1="1.626190625" y1="1.89638125" x2="2.125" y2="2.77" layer="51"/>
<rectangle x1="2.8789" y1="1.89756875" x2="3.375" y2="2.77" layer="51"/>
<rectangle x1="4.12545" y1="1.895209375" x2="4.625" y2="2.77" layer="51"/>
<pad name="1" x="4.375" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="2" x="3.125" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="3" x="1.875" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="4" x="0.625" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="5" x="-0.625" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="6" x="-1.875" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="7" x="-3.125" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
<pad name="8" x="-4.375" y="0.02" drill="0.5" diameter="0.762" shape="long" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="53048-0810">
<wire x1="-6.35" y1="-12.7" x2="1.27" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-12.7" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-12.7" width="0.4064" layer="94"/>
<text x="-6.355559375" y="10.8045" size="1.779559375" layer="95">&gt;NAME</text>
<text x="-6.353640625" y="-15.2487" size="1.77901875" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="53048-0810" prefix="XA">
<description>1.25mm Pitch PicoBlade Header, Right Angle, 8 Circuits &lt;a href="https://pricing.snapeda.com/parts/53048-0810/Molex/view-part?ref=eda"&gt;Check availability&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="53048-0810" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="MOLEX_53048-0810">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="In Stock"/>
<attribute name="CHECK_PRICES" value="https://www.snapeda.com/parts/53048-0810/Molex/view-part/?ref=eda"/>
<attribute name="DESCRIPTION" value=" 8 way through board PCB 90deg header | Molex Incorporated 53048-0810 "/>
<attribute name="MF" value="Molex"/>
<attribute name="MP" value="53048-0810"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://www.snapeda.com/api/url_track_click_mouser/?unipart_id=53851&amp;manufacturer=Molex&amp;part_name=53048-0810&amp;search_term=picoblade 1.25mm header rightangle 8way"/>
<attribute name="SNAPEDA_LINK" value="https://www.snapeda.com/parts/53048-0810/Molex/view-part/?ref=snap"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X03" urn="urn:adsk.eagle:footprint:22340/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="1X03/90" urn="urn:adsk.eagle:footprint:22341/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
</package>
<package name="1X06" urn="urn:adsk.eagle:footprint:22361/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06/90" urn="urn:adsk.eagle:footprint:22362/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-8.255" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="9.525" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="1X03" urn="urn:adsk.eagle:package:22458/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03"/>
</packageinstances>
</package3d>
<package3d name="1X03/90" urn="urn:adsk.eagle:package:22459/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03/90"/>
</packageinstances>
</package3d>
<package3d name="1X06" urn="urn:adsk.eagle:package:22472/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X06"/>
</packageinstances>
</package3d>
<package3d name="1X06/90" urn="urn:adsk.eagle:package:22475/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X06/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD3" urn="urn:adsk.eagle:symbol:22339/1" library_version="4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD6" urn="urn:adsk.eagle:symbol:22360/1" library_version="4">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X3" urn="urn:adsk.eagle:component:22524/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22458/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="92" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22459/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="17" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X6" urn="urn:adsk.eagle:component:22533/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD6" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="1X06">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22472/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="79" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X06/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22475/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="10" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$2" library="LILYGOMINI" deviceset="LILYGOPLUSMINI" device=""/>
<part name="PLANTOWER" library="ConectorPlantower" deviceset="53048-0810" device=""/>
<part name="STEPUP" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="RGB" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="SD" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X6" device="" package3d_urn="urn:adsk.eagle:package:22472/2"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$2" gate="LILYGO-D1MINI-PLUS" x="0" y="22.86" smashed="yes"/>
<instance part="PLANTOWER" gate="G$1" x="0" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="-10.8045" y="36.824440625" size="1.779559375" layer="95" rot="R90"/>
<attribute name="VALUE" x="15.2487" y="36.826359375" size="1.77901875" layer="96" rot="R90"/>
</instance>
<instance part="STEPUP" gate="A" x="25.4" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="19.685" y="36.83" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="33.02" y="36.83" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="RGB" gate="A" x="63.5" y="20.32" smashed="yes">
<attribute name="NAME" x="57.15" y="26.035" size="1.778" layer="95"/>
<attribute name="VALUE" x="57.15" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="SD" gate="A" x="-35.56" y="15.24" smashed="yes" rot="R180">
<attribute name="NAME" x="-29.21" y="4.445" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="-29.21" y="25.4" size="1.778" layer="96" rot="R180"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="RX-PM" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="4"/>
<wire x1="0" y1="40.64" x2="0" y2="33.02" width="0.1524" layer="91"/>
<label x="0" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<wire x1="-5.08" y1="12.7" x2="-10.16" y2="12.7" width="0.1524" layer="91"/>
<label x="-12.7" y="12.7" size="1.778" layer="95"/>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="5"/>
</segment>
</net>
<net name="TX-PM" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="5"/>
<wire x1="2.54" y1="40.64" x2="2.54" y2="33.02" width="0.1524" layer="91"/>
<label x="2.54" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<wire x1="-10.16" y1="15.24" x2="-5.08" y2="15.24" width="0.1524" layer="91"/>
<label x="-12.7" y="15.24" size="1.778" layer="95"/>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="4"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="GND"/>
<wire x1="25.4" y1="5.08" x2="30.48" y2="5.08" width="0.1524" layer="91"/>
<label x="27.94" y="5.08" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="2"/>
<wire x1="-5.08" y1="40.64" x2="-5.08" y2="33.02" width="0.1524" layer="91"/>
<label x="-5.08" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="STEPUP" gate="A" pin="2"/>
<wire x1="25.4" y1="40.64" x2="25.4" y2="33.02" width="0.1524" layer="91"/>
<label x="25.4" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="RGB" gate="A" pin="2"/>
<wire x1="60.96" y1="20.32" x2="53.34" y2="20.32" width="0.1524" layer="91"/>
<label x="53.34" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="SD" gate="A" pin="1"/>
<wire x1="-33.02" y1="7.62" x2="-25.4" y2="7.62" width="0.1524" layer="91"/>
<label x="-27.94" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="SD" gate="A" pin="4"/>
<wire x1="-33.02" y1="15.24" x2="-25.4" y2="15.24" width="0.1524" layer="91"/>
<label x="-27.94" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="6"/>
<wire x1="-5.08" y1="10.16" x2="-10.16" y2="10.16" width="0.1524" layer="91"/>
<label x="-10.16" y="10.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<pinref part="SD" gate="A" pin="2"/>
<wire x1="-33.02" y1="10.16" x2="-25.4" y2="10.16" width="0.1524" layer="91"/>
<label x="-27.94" y="10.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="7"/>
<wire x1="-5.08" y1="7.62" x2="-10.16" y2="7.62" width="0.1524" layer="91"/>
<label x="-10.16" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="RST"/>
<wire x1="-5.08" y1="20.32" x2="-10.16" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="1"/>
<wire x1="-7.62" y1="40.64" x2="-7.62" y2="33.02" width="0.1524" layer="91"/>
<label x="-7.62" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="STEPUP" gate="A" pin="3"/>
<wire x1="27.94" y1="40.64" x2="27.94" y2="33.02" width="0.1524" layer="91"/>
<label x="27.94" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="3"/>
<wire x1="-2.54" y1="40.64" x2="-2.54" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="6"/>
<wire x1="5.08" y1="40.64" x2="5.08" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="7"/>
<wire x1="7.62" y1="40.64" x2="7.62" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="PLANTOWER" gate="G$1" pin="8"/>
<wire x1="10.16" y1="40.64" x2="10.16" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="STEPUP" gate="A" pin="1"/>
<wire x1="22.86" y1="40.64" x2="22.86" y2="33.02" width="0.1524" layer="91"/>
<label x="22.86" y="33.02" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="3V3"/>
<wire x1="-5.08" y1="2.54" x2="-10.16" y2="2.54" width="0.1524" layer="91"/>
<label x="-10.16" y="2.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="RGB" gate="A" pin="1"/>
<wire x1="60.96" y1="22.86" x2="53.34" y2="22.86" width="0.1524" layer="91"/>
<label x="53.34" y="22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="SD" gate="A" pin="6"/>
<wire x1="-33.02" y1="20.32" x2="-25.4" y2="20.32" width="0.1524" layer="91"/>
<label x="-27.94" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="RGB" class="0">
<segment>
<pinref part="RGB" gate="A" pin="3"/>
<wire x1="60.96" y1="17.78" x2="53.34" y2="17.78" width="0.1524" layer="91"/>
<label x="53.34" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="10"/>
<wire x1="-5.08" y1="5.08" x2="-10.16" y2="5.08" width="0.1524" layer="91"/>
<label x="-10.16" y="5.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="CS" class="0">
<segment>
<pinref part="SD" gate="A" pin="5"/>
<wire x1="-33.02" y1="17.78" x2="-25.4" y2="17.78" width="0.1524" layer="91"/>
<label x="-27.94" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<label x="25.4" y="10.16" size="1.778" layer="95"/>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="9"/>
<wire x1="25.4" y1="10.16" x2="30.48" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CLK" class="0">
<segment>
<pinref part="SD" gate="A" pin="3"/>
<wire x1="-33.02" y1="12.7" x2="-25.4" y2="12.7" width="0.1524" layer="91"/>
<label x="-27.94" y="12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="LILYGO-D1MINI-PLUS" pin="8"/>
<wire x1="25.4" y1="7.62" x2="30.48" y2="7.62" width="0.1524" layer="91"/>
<label x="25.4" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
