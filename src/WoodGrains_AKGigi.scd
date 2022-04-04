(
//Wait server boot
s.waitForBoot({
	//Define all the variables
	var title, titleBox, soundNameBox;
	var backGroundColor;
	var box_x = 40, box_y = 90, dist = 170;
	var box1, box2, box3;
	var btnBox, routineBtnBox, panBox, knobBox, scopeBox, scopefBox, btnSampleBox, propBox;
	var distKnob = 40, distIntraKnob = 100, distRoutineBtn = 90;
	var btn1, routineBtn1, panSliderBox1, volSliderBox1, knob1Box1, knob2Box1, knob3Box1, scopeBox1, knob1_1, knob1_2, knob1_3, knobr1_1, knobr1_2, knobr1_3;
	var btn2, routineBtn2, panSliderBox2, volSliderBox2, knob1Box2, knob2Box2, knob3Box2, scopeBox2, knob2_1, knob2_2, knob2_3, knobr2_1, knobr2_2, knobr2_3;
	var btn3, routineBtn3, panSliderBox3, volSliderBox3, knob1Box3, knob2Box3, knob3Box3, scopeBox3, knob3_1, knob3_2, knob3_3, knobr3_1, knobr3_2, knobr3_3;
	var btn4, routineBtn4, panSliderBox4, volSliderBox4, knob1Box4, knob2Box4, knob3Box4, scopeBox4, knob4_1, knob4_2, knob4_3, knobr4_1, knobr4_2, knobr4_3;
	var btnScope1, btnScope2, btnScope3, btnScope4, btnScopeBox;
	var btnSample;
	var distBox, widthBox = 250;
	var f1, f2, f3, f4;
	var c1, c2, c3, c4, c5, c6, c7, c8;
	var width = 1200, height = 700;
	//Sample and images path
	~path = thisProcess.nowExecutingPath.dirname;
	~samplePath = (~path +/+ "../sample/Cello.wav");
	~image1Path = (~path +/+ "../images/fHoleL.png");
	~image2Path = (~path +/+ "../images/fHoleR.png");

	//Define the Sample Buffer
	b = Buffer.readChannel(s,~samplePath, channels:[0]);

	//Define the window and what to do on close
	w = Window("AKGigi GUI", Rect((Window.screenBounds.width-width)/2, (Window.screenBounds.height-height)/2, width, height), resizable:false).front;
	w.onClose = {
		~r1.stop;~r2.stop;~r3.stop;~r4.stop;
		if(c5.notNil){
			c5.kill;
		};
		if(c6.notNil){
			c6.kill;
		};
		if(c7.notNil){
			c7.kill;
		};
		if(c8.notNil){
			c8.kill;
		};
		s.freeAll;
	};

	distBox = width/4 - widthBox;

	//"Drawing" the window
	w.drawFunc = {
		var num = 250, dispersion;
		// Background:
		Pen.addRect(w.view.bounds.insetBy(0));
		Pen.fillRadialGradient(w.view.bounds.center + ((panSliderBox1.value + panSliderBox2.value + panSliderBox3.value + panSliderBox4.value)*100), w.view.bounds.center + ((panSliderBox1.value + panSliderBox2.value + panSliderBox3.value + panSliderBox4.value)*100), 0 + ((volSliderBox1.value + volSliderBox2.value +volSliderBox3.value + volSliderBox4.value)/2) , 400 + ((volSliderBox1.value + volSliderBox2.value +volSliderBox3.value + volSliderBox4.value)*2), Color.new((190*(1+(0.025*(knobr1_1.value + knobr1_2.value + knobr1_3.value + knobr2_1.value + knobr2_2.value + knobr2_3.value + knobr3_1.value + knobr3_2.value + knobr3_3.value + knobr4_1.value + knobr4_2.value + knobr4_3.value))))/255, (120*(1+(0.04*(knobr1_1.value + knobr1_2.value + knobr1_3.value + knobr2_1.value + knobr2_2.value + knobr2_3.value + knobr3_1.value + knobr3_2.value + knobr3_3.value + knobr4_1.value + knobr4_2.value + knobr4_3.value))))/255, (50*(1+(0.1*(knobr1_1.value + knobr1_2.value + knobr1_3.value + knobr2_1.value + knobr2_2.value + knobr2_3.value + knobr3_1.value + knobr3_2.value + knobr3_3.value + knobr4_1.value + knobr4_2.value + knobr4_3.value))))/255, 1),
			Color.new((72*(1+(0.047*((5+knob1_1.value/10) + (10+knob1_2.value/20) + knob1_3.value + knob2_1.value + knob2_2.value + knob2_3.value + knob3_1.value + knob3_2.value + knob3_3.value + knob4_1.value + knob4_2.value + knob4_3.value))))/255,(11*(1+(0.3*((5+knob1_1.value/10) + (10+knob1_2.value/20) + knob1_3.value + knob2_1.value + knob2_2.value + knob2_3.value + knob3_1.value + knob3_2.value + knob3_3.value + knob4_1.value + knob4_2.value + knob4_3.value))))/255,(10*(1+(0.33*((5+knob1_1.value/10) + (10+knob1_2.value/20) + knob1_3.value + knob2_1.value + knob2_2.value + knob2_3.value + knob3_1.value + knob3_2.value + knob3_3.value + knob4_1.value + knob4_2.value + knob4_3.value))))/255, 1));


		i = Image.new(~image1Path);
		l = 400;
		Pen.drawImage(Rect(52, 70, l, (l*1380)/958), i, operation: 'sourceOver', opacity: 0.4);
		i = Image.new(~image2Path);
		Pen.drawImage(Rect(750, 70, l, (l*1380)/958), i, operation: 'sourceOver', opacity: 0.4);
		// Background squares:
		num.do{|i|
			Pen.fillColor = Color.yellow(rrand(0.0, 1), rrand(0.1, 0.55));
			dispersion = rrand(((-1)*height/2), (height/2));
			Pen.fillRect(Rect((i/num)*width, height/2 + dispersion, 2.rand, 95.rand));
		};

		// Sound Boxes:
		box1 = Rect(distBox/2, box_y, widthBox, height-(1.2*box_y));
		Pen.strokeColor_(Color.fromHexString("010303")).width_(2);
		Pen.strokeRect(box1);
		Pen.strokeRect(box1.moveBy(distBox + widthBox, 0)).strokeColor = Color.fromHexString("010303");
		Pen.strokeRect(box1.moveBy(2*(distBox + widthBox), 0)).strokeColor = Color.fromHexString("010303");
		Pen.strokeRect(box1.moveBy(3*(distBox + widthBox), 0)).strokeColor = Color.fromHexString("010303");


		//Sound Name Boxes:
		soundNameBox = Rect(distBox/2, box_y, widthBox, 30);
		Pen.font = Font( "Garamond", 20, true ); // Font passabili:  Snell Roundhand oppure Zapfino
		Pen.stringCenteredIn( "Rasp", soundNameBox, color: Color.fromHexString("F6C08c"));
		Pen.stringCenteredIn( "Sandpaper", soundNameBox.moveBy(widthBox+distBox, 0), color: Color.fromHexString("F6c08d"));
		Pen.stringCenteredIn( "Hammer", soundNameBox.moveBy(2*(widthBox+distBox), 0), color: Color.fromHexString("F6C08E"));
		Pen.stringCenteredIn( "Pizzicato", soundNameBox.moveBy(3*(widthBox+distBox), 0), color: Color.fromHexString("F5C08E"));

		// Scope Boxes:
		scopeBox = Rect((distBox/2)+5, box_y+160, widthBox-10, 200);
		Pen.strokeColor_(Color.fromHexString("6B3A38")).strokeRect(scopeBox);
		Pen.strokeRect(scopeBox.moveBy(distBox + widthBox, 0));
		Pen.strokeRect(scopeBox.moveBy(2*(distBox + widthBox), 0));
		Pen.strokeRect(scopeBox.moveBy(3*(distBox + widthBox), 0));

		// Title:
		titleBox = Rect(0, 0, width, 100);
		Pen.font = Font( "Garamond", 51 ); // Font passabili:  Snell Roundhand oppure Zapfino
		Pen.width = 0.1;
		Pen.stringCenteredIn( "WoodGrains", titleBox, color: Color.fromHexString("FFE2AE"));

		//Knobs Title:
		propBox = Rect(distBox/2, box_y, widthBox, 770);
		Pen.font = Font( "Garamond", 20, false );
		Pen.stringCenteredIn( "Granular Parameters", propBox, color: Color.black);
		Pen.stringCenteredIn( "Reverb", propBox.moveBy(0, 110), color: Color.fromHexString("010303"));
		Pen.stringCenteredIn( "Granular Parameters", propBox.moveBy(widthBox+distBox, 0), color: Color.fromHexString("010303"));
		Pen.stringCenteredIn( "Reverb", propBox.moveBy(widthBox+distBox, 110), color: Color.fromHexString("010303"));
		Pen.stringCenteredIn( "Granular Parameters", propBox.moveBy(2*(widthBox+distBox), 0), color: Color.fromHexString("010303"));
		Pen.stringCenteredIn( "Reverb", propBox.moveBy(2*(widthBox+distBox), 110), color: Color.fromHexString("010303"));
		Pen.stringCenteredIn( "Granular Parameters", propBox.moveBy(3*(widthBox+distBox), 0), color: Color.fromHexString("010303"));
		Pen.stringCenteredIn( "Reverb", propBox.moveBy(3*(widthBox+distBox), 110), color: Color.fromHexString("010303"));
	};

	//Play/Pause Sample Button and SynthDef
	btnSampleBox = Rect(5, 5, 100, 25);
	btnSample = Button.new(w, btnSampleBox).states_([["Play sample", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")], ["Stop", Color.black, Color.fromHexString("F09D51") ]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond",size:15, bold:false);

	SynthDef(\sample, {
		arg buf = b;
		Out.ar([0,1], PlayBuf.ar(1, buf, loop:1));
	}).add;

	btnSample.action_({
		if(btnSample.value == 1){
			~sample = Synth(\sample)
		};
		if(btnSample.value == 0){
			~sample.free;
		};
	});

	//Play Sounds, play/pause Routine Buttons
	btnBox = Rect((distBox/2)+10, box_y+35, (widthBox/2)-20, 30);
	btn1 = Button.new(w, btnBox).states_([["Play", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);
	routineBtn1 = Button.new(w, btnBox.moveBy((widthBox/2), 0)).states_([["Start Routine",Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")],["Stop Routine",Color.black, Color.fromHexString("F09D51")]]).font_("Garamond").focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	btn2 = Button.new(w, btnBox.moveBy(distBox + widthBox, 0)).states_([["Play", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);
	routineBtn2 = Button.new(w, btnBox.moveBy((widthBox/2)+((distBox + widthBox)), 0)).states_([["Start Routine",Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")],["Stop Routine",Color.black, Color.fromHexString("F09D51")]]).font_("Garamond").focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	routineBtn2 = Button.new(w, btnBox.moveBy((widthBox/2)+((distBox + widthBox)), 0)).states_([["Start Routine",Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")],["Stop Routine",Color.black, Color.fromHexString("F09D51")]]).font_("Garamond").focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);


	btn3 = Button.new(w, btnBox.moveBy(2*(distBox + widthBox), 0)).states_([["Play", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	routineBtn3 = Button.new(w, btnBox.moveBy((widthBox/2)+(2*(distBox + widthBox)), 0)).states_([["Start Routine",Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")],["Stop Routine",Color.black, Color.fromHexString("F09D51")]]).font_("Garamond").focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	btn4 = Button.new(w, btnBox.moveBy(3*(distBox + widthBox), 0)).states_([["Play", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	routineBtn4 = Button.new(w, btnBox.moveBy((widthBox/2)+(3*(distBox + widthBox)), 0)).states_([["Start Routine",Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")],["Stop Routine",Color.black, Color.fromHexString("F09D51")]]).font_("Garamond").focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	//Pan and Volume Sliders
	panBox = Rect(0, box_y + 95, widthBox, 20);
	volSliderBox1 = EZSlider(parent:w, bounds: panBox, numberWidth: 30, label:"Vol", controlSpec: ControlSpec(0,100,\lin), initVal:50).font = Font("Garamond", 17);

	panSliderBox1 = EZSlider(parent:w, bounds: panBox.moveBy(0, 30), numberWidth: 30, label:"Pan", controlSpec: ControlSpec(-1,1,\lin), initVal:0).font = Font("Garamond", 17);
	volSliderBox1.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));
	panSliderBox1.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));

	volSliderBox1.numberView.maxDecimals_(0).align_(\center);
	panSliderBox1.numberView.maxDecimals_(1).align_(\center);

	volSliderBox2 = EZSlider(parent:w, bounds: panBox.moveBy(distBox + widthBox,0), numberWidth: 30, label:"Vol", controlSpec: ControlSpec(0,100,\lin), initVal:50).font = Font("Garamond", 17);
	volSliderBox2.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));

	panSliderBox2 = EZSlider(parent:w, bounds: panBox.moveBy(distBox + widthBox, 30), numberWidth: 30, label:"Pan", controlSpec: ControlSpec(-1,1,\lin), initVal:0).font = Font("Garamond", 17);

	panSliderBox2.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));
	volSliderBox2.numberView.maxDecimals_(0).align_(\center);
	panSliderBox2.numberView.maxDecimals_(1).align_(\center);

	volSliderBox3 = EZSlider(parent:w, bounds: panBox.moveBy(2*(distBox + widthBox),0), numberWidth: 30, label:"Vol", controlSpec: ControlSpec(0,100,\lin), initVal:50).font = Font("Garamond", 17);

	panSliderBox3 = EZSlider(parent:w, bounds: panBox.moveBy(2*(distBox + widthBox), 30), numberWidth: 30, label:"Pan", controlSpec: ControlSpec(-1,1,\lin), initVal:0).font = Font("Garamond", 17);

	volSliderBox3.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));
	panSliderBox3.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));
	volSliderBox3.numberView.maxDecimals_(0).align_(\center);
	panSliderBox3.numberView.maxDecimals_(1).align_(\center);

	volSliderBox4 = EZSlider(parent:w, bounds: panBox.moveBy(3*(distBox + widthBox),0), numberWidth: 30, label:"Vol", controlSpec: ControlSpec(0,100,\lin), initVal:50).font = Font("Garamond", 17);
	panSliderBox4 = EZSlider(parent:w, bounds: panBox.moveBy(3*(distBox + widthBox), 30), numberWidth: 30, label:"Pan", controlSpec: ControlSpec(-1,1,\lin), initVal:0).font = Font("Garamond", 17);
	volSliderBox4.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));
	panSliderBox4.setColors(stringColor: Color.fromHexString("F5C08E"), sliderBackground: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColor: Color.fromHexString("6C2423")).sliderView.focusColor_(Color.fromHexString("6C2423"));
	volSliderBox4.numberView.maxDecimals_(0).align_(\center);
	panSliderBox4.numberView.maxDecimals_(1).align_(\center);


	//Granular Synthesis Parameters Knobs
	knobBox = Rect(widthBox/4, 485, 50, 80);
	knob1_1 = EZKnob(w, knobBox.moveBy(-10, 0), "Curve", controlSpec: ControlSpec(-5,5,\lin),initVal:0, layout: \vert2);
	knob1_2 = EZKnob(w, knobBox.moveBy(widthBox/4,0), "Rate", controlSpec: ControlSpec(-10,10,\lin),initVal:0, layout: \vert2);
	knob1_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+10,0), "Pos", controlSpec: ControlSpec(0.1,0.9,\lin),initVal:0.2, layout: \vert2);

	knobr1_1 = EZKnob(w, knobBox.moveBy(-10, 110), "Dry/Wet", controlSpec: ControlSpec(0,1,\lin),initVal:0.2, layout: \vert2);
	knobr1_2 = EZKnob(w, knobBox.moveBy(widthBox/4, 110), "Room", controlSpec: ControlSpec(0,1,\lin),initVal:0.3, layout: \vert2);
	knobr1_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+10, 110), "Damp", controlSpec: ControlSpec(0,1,\lin),initVal:1, layout: \vert2);

	knob2_1 = EZKnob(w, knobBox.moveBy(-10+(distBox + widthBox), 0), "Trig", controlSpec: ControlSpec(0,1,\lin),initVal:1, layout: \vert2);
	knob2_2 = EZKnob(w, knobBox.moveBy(widthBox/4+ ((distBox + widthBox)),0), "Grain", controlSpec: ControlSpec(0.1,1,\lin),initVal:0.25, layout: \vert2);
	knob2_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+((distBox + widthBox))+10,0), "Curve", controlSpec: ControlSpec(0,1,\lin),initVal:0.5, layout: \vert2);

	knobr2_1 = EZKnob(w, knobBox.moveBy(-10+((distBox + widthBox)), 110), "Dry/Wet", controlSpec: ControlSpec(0,1,\lin),initVal:0.2, layout: \vert2);
	knobr2_2 = EZKnob(w, knobBox.moveBy(widthBox/4+((distBox + widthBox)), 110), "Room", controlSpec: ControlSpec(0,1,\lin),initVal:0.3, layout: \vert2);
	knobr2_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+((distBox + widthBox))+10, 110), "Damp", controlSpec: ControlSpec(0,1,\lin),initVal:1, layout: \vert2);

	knob3_1 = EZKnob(w, knobBox.moveBy(-10+(2*(distBox + widthBox)), 0), "Rate", controlSpec: ControlSpec(0,5,\lin),initVal:2, layout: \vert2);
	knob3_2 = EZKnob(w, knobBox.moveBy(widthBox/4+ (2*(distBox + widthBox)),0), "Grain", controlSpec: ControlSpec(0.001,0.025,\lin),initVal:0.01, layout: \vert2);
	knob3_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+(2*(distBox + widthBox))+10,0), "Pos", controlSpec: ControlSpec(0.1,0.9,\lin),initVal:0.2, layout: \vert2);

	knobr3_1 = EZKnob(w, knobBox.moveBy(-10+(2*(distBox + widthBox)), 110), "Dry/Wet", controlSpec: ControlSpec(0,1,\lin),initVal:0.2, layout: \vert2);
	knobr3_2 = EZKnob(w, knobBox.moveBy(widthBox/4+(2*(distBox + widthBox)), 110), "Room", controlSpec: ControlSpec(0,1,\lin),initVal:0.2, layout: \vert2);
	knobr3_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+(2*(distBox + widthBox))+10, 110), "Damp", controlSpec: ControlSpec(0,1,\lin),initVal:0.5, layout: \vert2);

	knob4_1 = EZKnob(w, knobBox.moveBy(-10+(3*(distBox + widthBox)), 0), "Note", controlSpec: ControlSpec(1,7,\lin, 1),initVal:4, layout: \vert2);
	knob4_2 = EZKnob(w, knobBox.moveBy(widthBox/4+ (3*(distBox + widthBox)),0), "Trem", controlSpec: ControlSpec(0,8,\lin),initVal:0, layout: \vert2);
	knob4_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+(3*(distBox + widthBox))+10,0), "Pos", controlSpec: ControlSpec(0.1,0.9,\lin),initVal:0.65, layout: \vert2);

	knobr4_1 = EZKnob(w, knobBox.moveBy(-10+(3*(distBox + widthBox)), 110), "Dry/Wet", controlSpec: ControlSpec(0,1,\lin),initVal:0.5, layout: \vert2);
	knobr4_2 = EZKnob(w, knobBox.moveBy(widthBox/4+(3*(distBox + widthBox)), 110), "Room", controlSpec: ControlSpec(0,1,\lin),initVal:0.5, layout: \vert2);
	knobr4_3 = EZKnob(w, knobBox.moveBy(2*(widthBox/4)+(3*(distBox + widthBox))+10, 110), "Damp", controlSpec: ControlSpec(0,1,\lin),initVal:0.5, layout: \vert2);

	knob1_1.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob1_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob1_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob2_1.setColors(stringColor: Color.fromHexString("F5C08E"), numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob2_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob2_3.setColors(stringColor: Color.fromHexString("F5C08E"), numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob3_1.setColors(stringColor: Color.fromHexString("F5C08E"), numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob3_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob3_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob4_1.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob4_2.setColors(stringColor: Color.fromHexString("F5C08E"), numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob4_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knob1_1.numberView.align_(\center);
	knob1_2.numberView.align_(\center);
	knob1_3.numberView.align_(\center);
	knob2_1.numberView.align_(\center);
	knob2_2.numberView.align_(\center);
	knob2_3.numberView.align_(\center);
	knob3_1.numberView.align_(\center);
	knob3_2.numberView.align_(\center);
	knob3_3.numberView.align_(\center);
	knob4_1.numberView.align_(\center);
	knob4_2.numberView.align_(\center);
	knob4_3.numberView.align_(\center);

	knob1_1.knobView.mode_(\vert);
	knob1_2.knobView.mode_(\vert);
	knob1_3.knobView.mode_(\vert);
	knob2_1.knobView.mode_(\vert);
	knob2_2.knobView.mode_(\vert);
	knob2_3.knobView.mode_(\vert);
	knob3_1.knobView.mode_(\vert);
	knob3_2.knobView.mode_(\vert);
	knob3_3.knobView.mode_(\vert);
	knob4_1.knobView.mode_(\vert);
	knob4_2.knobView.mode_(\vert);
	knob4_3.knobView.mode_(\vert);

	//Reverb Effect Knobs
	knobr1_1.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black, knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr1_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr1_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr2_1.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr2_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr2_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr3_1.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr3_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr3_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr4_1.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr4_2.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr4_3.setColors(stringColor: Color.fromHexString("F5C08E"),numBackground: Color.fromHexString("F5C08E"), numTypingColor: Color.black,knobColors: [Color.fromHexString("6C2423"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c"), Color.fromHexString("F6C08c")]).knobView.focusColor_(Color.fromHexString("F6C08c"));

	knobr1_1.numberView.align_(\center);
	knobr1_2.numberView.align_(\center);
	knobr1_3.numberView.align_(\center);
	knobr2_1.numberView.align_(\center);
	knobr2_2.numberView.align_(\center);
	knobr2_3.numberView.align_(\center);
	knobr3_1.numberView.align_(\center);
	knobr3_2.numberView.align_(\center);
	knobr3_3.numberView.align_(\center);
	knobr4_1.numberView.align_(\center);
	knobr4_2.numberView.align_(\center);
	knobr4_3.numberView.align_(\center);

	knobr1_1.knobView.mode_(\vert);
	knobr1_2.knobView.mode_(\vert);
	knobr1_3.knobView.mode_(\vert);
	knobr2_1.knobView.mode_(\vert);
	knobr2_2.knobView.mode_(\vert);
	knobr2_3.knobView.mode_(\vert);
	knobr3_1.knobView.mode_(\vert);
	knobr3_2.knobView.mode_(\vert);
	knobr3_3.knobView.mode_(\vert);
	knobr4_1.knobView.mode_(\vert);
	knobr4_2.knobView.mode_(\vert);
	knobr4_3.knobView.mode_(\vert);

	//Bus Allocation
	~busRasp = Bus.audio(s, 2);
	~busSP = Bus.audio(s, 2);
	~busHammer = Bus.audio(s, 2);
	~busPizz = Bus.audio(s, 2);

	//Scoping SynthDef, used to plot the Scope and the FreqScope of the sounds
	SynthDef(\scoping, {
		arg bus, buffy;
		ScopeOut2.ar(In.ar(bus,2), buffy, maxFrames: 8092, scopeFrames: 1024);
		Out.ar(0, In.ar(bus, 2));
		Out.ar((bus), In.ar(bus, 1)+In.ar(bus+1, 1)); //FreqScope reads only 1 channel a time, so we sum left and right channels to plot them.
	}).add;

	//Scoping buttons used to change between Scope and FreqScope
	btnScopeBox = Rect(30, 455, 25, 25);
	btnScope1 = Button(w, btnScopeBox)
	.states_([["FD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")], ["TD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	btnScope2 = Button(w, btnScopeBox.moveBy((distBox + widthBox), 0))
	.states_([["FD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")], ["TD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	btnScope3 = Button(w, btnScopeBox.moveBy(2*(distBox + widthBox), 0))
	.states_([["FD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")], ["TD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	btnScope4 = Button(w, btnScopeBox.moveBy(3*(distBox + widthBox), 0))
	.states_([["FD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")], ["TD", Color.fromHexString("F6C08c"), Color.fromHexString("6C2423")]]).focusColor_(Color.fromHexString("FFE2AE")).font = Font("Garamond", 15);

	//ScopeView and FreqScopeView
	scopeBox = Rect((distBox/2)+5, box_y+160, widthBox-11, 199);
	scopefBox = Rect((distBox/2)+5, box_y+160, widthBox-11, 199);

	f1 = Buffer.alloc(s,1024,2);
	f2 = Buffer.alloc(s,1024,2);
	f3 = Buffer.alloc(s, 1024,2);
	f4 = Buffer.alloc(s, 1024,2);


	c1 = ScopeView.new(w, scopeBox);
	c2 = ScopeView.new(w, scopeBox.moveBy(distBox + widthBox, 0));
	c3 = ScopeView.new(w, scopeBox.moveBy(2*(distBox + widthBox), 0));
	c4 = ScopeView.new(w, scopeBox.moveBy(3*(distBox + widthBox), 0));

	c1.bufnum = f1.bufnum;
	c1.server_(s);
	c1.start;

	c2.bufnum = f2.bufnum;
	c2.server_(s);
	c2.start;

	c3.bufnum = f3.bufnum;
	c3.server_(s);
	c3.start;

	c4.bufnum = f4.bufnum;
	c4.server_(s);
	c4.start;


	c1.background_(Color.fromHexString("6C2423"));// Assegna un colore allo sfondo
	c1.waveColors_([Color.fromHexString("B3E3E6"), Color.fromHexString("ff1d70")]); // Assegna un colore alla forma d'onda
	c1.style_(0);

	c2.background_(Color.fromHexString("6C2423"));
	c2.waveColors_([Color.fromHexString("B3E3E6"), Color.fromHexString("ff1d70")]);
	c2.style_(0);
	c2.yZoom_(4);

	c3.background_(Color.fromHexString("6C2423"));
	c3.waveColors_([Color.fromHexString("B3E3E6"), Color.fromHexString("ff1d70")]);
	c3.style_(0);

	c4.background_(Color.fromHexString("6C2423"));
	c4.waveColors_([Color.fromHexString("B3E3E6"), Color.fromHexString("ff1d70")]);
	c4.style_(0);
	c4.yZoom_(2);

	{~scope1 = Synth(\scoping, [\buffy, f1.bufnum, \bus, ~busRasp])}.defer(0.1);
	{~scope2 = Synth(\scoping, [\buffy, f2.bufnum, \bus, ~busSP])}.defer(0.1);
	{~scope3 = Synth(\scoping, [\buffy, f3.bufnum, \bus, ~busHammer])}.defer(0.1);
	{~scope4 = Synth(\scoping, [\buffy, f4.bufnum, \bus, ~busPizz])}.defer(0.1);


	btnScope1.action_({
		if(btnScope1.value == 1){
			if(btnScope2.value == 1){
				c6.active_(false);
				c6.scope.visible = false;
				c6.kill;
				c2.start;
				btnScope2.value_(0);
			};
			if(btnScope3.value == 1){
				c7.active_(false);
				c7.scope.visible = false;
				c7.kill;
				c3.start;
				btnScope3.value_(0);
			};
			if(btnScope4.value == 1){
				c8.active_(false);
				c8.scope.visible = false;
				c8.kill;
				c4.start;
				btnScope4.value_(0);
			};
			{c1.stop;
			c5 = FreqScopeView.new(w, scopefBox);
			c5.freqMode_(1);
			c5.allocBuffers;
			c5.inBus_(~busRasp);
			c5.server_(s);
			c5.active_(true);
			c5.scope.visible = true;
			c5.background_(Color.fromHexString("6C2423"));
			c5.waveColors_([Color.fromHexString("ff1d70")])}.defer(0.2);
		};
		if(btnScope1.value == 0){
			{c5.active_(false);
			c5.scope.visible = false;
			c5.kill;
			c1.start}.defer(0.2);
		};
	});

	btnScope2.action_({
		if(btnScope2.value == 1){
			if(btnScope1.value == 1){
				c5.active_(false);
				c5.scope.visible = false;
				c5.kill;
				c1.start;
				btnScope1.value_(0);
			};
			if(btnScope3.value == 1){
				c7.active_(false);
				c7.scope.visible = false;
				c7.kill;
				c3.start;
				btnScope3.value_(0);
			};
			if(btnScope4.value == 1){
				c8.active_(false);
				c8.scope.visible = false;
				c8.kill;
				c4.start;
				btnScope4.value_(0);
			};
			{c2.stop;
			c6 = FreqScopeView.new(w, scopefBox.moveBy(distBox + widthBox, 0));
			c6.freqMode_(1);
			c6.allocBuffers;
			c6.inBus_(~busSP);
			c6.server_(s);
			c6.active_(true);
			c6.scope.visible = true;
			c6.background_(Color.fromHexString("6C2423"));
			c6.waveColors_([Color.fromHexString("ff1d70")])}.defer(0.2);
		};
		if(btnScope2.value == 0){
			{c6.active_(false);
			c6.scope.visible = false;
			c6.kill;
			c2.start}.defer(0.2);
		};
	});

	btnScope3.action_({
		if(btnScope3.value == 1){
			if(btnScope2.value == 1){
				c6.active_(false);
				c6.scope.visible = false;
				c6.kill;
				c2.start;
				btnScope2.value_(0);
			};
			if(btnScope1.value == 1){
				c5.active_(false);
				c5.scope.visible = false;
				c5.kill;
				c1.start;
				btnScope1.value_(0);
			};
			if(btnScope4.value == 1){
				c8.active_(false);
				c8.scope.visible = false;
				c8.kill;
				c4.start;
				btnScope4.value_(0);
			};
			{c3.stop;
			c7 = FreqScopeView.new(w, scopefBox.moveBy(2*(distBox + widthBox), 0));
			c7.freqMode_(1);
			c7.inBus_(~busHammer);
			c7.server_(s);
			c7.active_(true);
			c7.scope.visible = true;
			c7.background_(Color.fromHexString("6C2423"));
			c7.waveColors_([Color.fromHexString("ff1d70")])}.defer(0.2);
		};
		if(btnScope3.value == 0){
			{c7.active_(false);
			c7.scope.visible = false;
			c7.kill;
			c3.start}.defer(0.2);
		};
	});

	btnScope4.action_({
		if(btnScope4.value == 1){
			if(btnScope2.value == 1){
				c6.active_(false);
				c6.scope.visible = false;
				c6.kill;
				c2.start;
				btnScope2.value_(0);
			};
			if(btnScope3.value == 1){
				c7.active_(false);
				c7.scope.visible = false;
				c7.kill;
				c3.start;
				btnScope3.value_(0);
			};
			if(btnScope1.value == 1){
				c5.active_(false);
				c5.scope.visible = false;
				c5.kill;
				c1.start;
				btnScope1.value_(0);
			};
			{c4.stop;
			c8 = FreqScopeView.new(w, scopefBox.moveBy(3*(distBox + widthBox), 0));
			c8.freqMode_(1);
			c8.inBus_(~busPizz);
			c8.server_(s);
			c8.active_(true);
			c8.scope.visible = true;
			c8.background_(Color.fromHexString("6C2423"));
			c8.waveColors_([Color.fromHexString("ff1d70")])}.defer(0.2);
		};
		if(btnScope4.value == 0){
			{c8.active_(false);
			c8.scope.visible = false;
			c8.kill;
			c4.start}.defer(0.2);
		};
	});


	// // Sound Box #1 __________________________

	//Synthdef Rasp
	SynthDef(\sg, {

		arg
		trig1 = #[200, 500, 0.5],
		grain1 = 0.01,
		rate1 = #[4, 8, 7, 9],
		pos1 = 0.2,

		trig2 = #[200, 500, 1],
		grain2 = 0.02,
		rate2 = 5,
		pos2 = 0.2,

		trig3 = #[200, 500, 1],
		grain3 = 0.02,
		rate3 = -5,
		pos3 = 0.2,

		curve = 0,

		pan = 0, envb = -1, vol = 1, bus, dw = 0.2, room = 0.3, damp = 1;

		var env, s1, s2, s3, sig;

		env = EnvGen.ar(Env([0, 1, 0], [exprand(0.2, 0.5), 0.02], curve: curve));
		FreeSelf.kr(TDelay.kr(Done.kr(env),1));

		s1 = GrainBuf.ar(
			numChannels: 2,
			trigger: Dust.ar(Line.ar(trig1.at(0), trig1.at(1), trig1.at(2))),
			dur: grain1,
			sndbuf: b,
			rate: Line.kr(exprand(rate1.at(0), rate1.at(1)), exprand(rate1.at(2), rate1.at(3))).midiratio,
			pos: pos1,
			pan: pan,
			envbufnum: envb);

		s2 = GrainBuf.ar(
			numChannels: 2,
			trigger: Dust.ar(Line.ar(trig2.at(0), trig2.at(1), trig2.at(2))),
			dur: grain2,
			sndbuf: b,
			rate: rate2.midiratio,
			pos: pos2,
			pan: pan,
			envbufnum: envb);

		s3 = GrainBuf.ar(
			numChannels: 2,
			trigger: Dust.ar(Line.ar(trig3.at(0), trig2.at(1), trig3.at(2))),
			dur: grain3,
			sndbuf: b,
			rate: rate3.midiratio,
			pos: pos3,
			pan: pan,
			envbufnum: envb);


		sig = ((s3+s2+s1)*env)*vol;
		Out.ar(bus, FreeVerb.ar(sig, dw, room, damp));
	}).add;


	// // Sound Box #2 __________________________

	//Synthdef Sandpaper
	SynthDef(\cv, {

		arg
		trig = 5000, //varia da 4000 a 5000
		grain = 0.0001, //0.0001 - 0.001
		rate = 40,
		pos = 0.5,
		curve = 0,

		pan = 0, envb = -1, vol = 0.0005, rel = 0.04, bus, dw = 0.2, room = 0.3, damp = 1; //0.0001 - 0.0005


		var sig, env, amp = (vol/grain)*0.01;

		env =  EnvGen.ar(Env([0, 1, 0], [exprand(0.1, 0.2), rel], curve: curve));
		FreeSelf.kr(TDelay.kr(Done.kr(env),1));

		sig = GrainBuf.ar(
			numChannels: 2,
			trigger:  Dust.ar(trig),
			dur: grain,
			sndbuf: b,
			rate: rate.midiratio,
			pos: pos,
			pan: pan,
			envbufnum: envb);

		sig = sig*env*amp;

		Out.ar(bus, FreeVerb.ar(sig, dw, room, damp));
	}).add;


	// // Sound Box #3 __________________________

	//Synthdef Hammer
	SynthDef(\mart, {

		arg
		grain1 = 0.015,
		rate1 = 0,
		pos1 = 0.2,

		grain2 = 0.02,
		rate2 = 2,       //0.1- 10 random
		pos2 = 0.1,

		grain3 = 0.05,
		rate3 = -22,
		pos3 = 0.1,

		pan = 0, envb = -1, vol = 5, bus, dw = 0.2, room = 0.2, damp = 0.5;

		var env1, envtr, s1, s2, s3, sig;


		env1 = EnvGen.ar(Env([0, 1, 0], [0.001, 0.3]));
		FreeSelf.kr(TDelay.kr(Done.kr(env1),1));

		s1 = GrainBuf.ar(
			numChannels: 2,
			trigger: Impulse.ar(1),
			dur: grain1,
			sndbuf: b,
			rate: rate1.midiratio,
			pos: pos1,
			pan: pan,
			envbufnum: envb);

		s2 = GrainBuf.ar(
			numChannels: 2,
			trigger: Impulse.ar(1),
			dur: grain2,
			sndbuf: b,
			rate: rate2.midiratio,
			pos: pos2,
			pan: pan,
			envbufnum: envb);

		s3 = GrainBuf.ar(
			numChannels: 2,
			trigger: Impulse.ar(1),
			dur: grain3,
			sndbuf: b,
			rate: rate3.midiratio,
			pos: pos3,
			pan: pan,
			envbufnum: envb);


		sig = ((s1*exprand(0.5, 1.5) + s2 + s3*0.2)*env1)*vol;

		Out.ar(bus, FreeVerb.ar(sig, dw, room, damp));
	}).add;

	// // Sound Box #4 __________________________

	//Synthdef Pizzicato
	SynthDef(\pizz, {

		arg
		trig, //varia da 4000 a 5000
		grain = 0.025,//0.0025 //0.0001 - 0.001
		rate = 0,
		pos = 0.7,
		interp = -4,
		trem = 0,

		pan = 0, envb = -4, vol = 5, bus, dw = 0.5, room = 0.5, damp = 0.5; //0.0001 - 0.0005


		var sig, env1, env2, amp = vol/grain;

		env1 =  EnvGen.ar(Env.perc(0.03, 1, 0.2, -10));
		env2 =  EnvGen.ar(Env.adsr(0.001, 0.05, 0.001, 0.8, curve:-8));
		FreeSelf.kr(TDelay.kr(Done.kr(env1),1.5));
		FreeSelf.kr(TDelay.kr(Done.kr(env2),1.5));
		sig = GrainBuf.ar(
			numChannels: 2,
			trigger:  Impulse.ar((SinOsc.kr(5)*trem)+trig),
			dur: grain,
			sndbuf: b,
			rate: (rate).midiratio,
			pos: pos,
			interp: interp,
			pan: pan,
			envbufnum: envb);

		sig = ((sig*env1)+(sig*env2*0.3))*amp*0.05;
		sig = BPF.ar(sig, trig, 0.5)+(BPF.ar(sig, trig*2)*0.5)+(BPF.ar(sig, trig*3)*0.025);
		Out.ar(bus, FreeVerb.ar(sig, dw, room, damp));
	}).add;

	//Routine for the Rasp Sound
	~r1 = Routine({
		loop({
			{~syRaspa = Synth(\sg, [\bus, ~busRasp, \vol, (volSliderBox1.value/30), \pan, panSliderBox1.value, \dw, knobr1_1.value, \room, (knobr1_2.value*0.8), \damp, knobr1_3.value, \pos1, knob1_3.value, \pos2, knob1_3.value, \pos3, knob1_3.value, \rate3, knob1_2.value, \curve, knob1_1.value])}.defer(0.2);
			exprand(0.8, 2.0).wait;
		})
	});

	//Routine for the Sandpaper Sound
	~r2 = Routine({
		loop({
			{~syCv = Synth(\cv, [\bus, ~busSP, \vol, (volSliderBox2.value/2000), \pan, panSliderBox2.value, \dw, knobr2_1.value, \room, (knobr2_2.value*0.8), \damp, knobr2_3.value, \grain, (knob2_2.value)*0.001/2.2, \curve, ((knob2_3.value*16)-8), \trig, ((knob2_1.value*3500)+1500)])}.defer(0.2);
			exprand(0.3, 0.4).wait;
		})
	});

	//Routine for the Hammer Sound
	~r3 = Routine({
		loop({
			{~syMart = Synth(\mart, [\bus, ~busHammer, \vol, (volSliderBox3.value/3), \pan, panSliderBox3.value, \dw, knobr3_1.value, \room, (knobr3_2.value*0.8), \damp, knobr3_3.value, \pos1, knob3_3.value, \pos2, knob3_3.value, \pos3, knob3_3.value, \rate2, knob3_1.value, \rate3, ((knob3_1.value)-20), \grain2, knob3_2.value])}.defer(0.2);
			exprand(0.3, 0.6).wait;
		})
	});

	//Routine for the Pizzicato Sound
	~rate = #[329.63, 349.23, 392, 440, 493.883, 523.251, 587.330];
	~r4 = Routine({
		loop({
			~count = knob4_1.value-1;
			{~syPizz = Synth(\pizz, [\bus, ~busPizz, \trig, ~rate.at(~count), \vol, (volSliderBox4.value/10), \pan, panSliderBox4.value, \dw, knobr4_1.value, \room, (knobr4_2.value*0.8), \damp, knobr4_3.value, \pos, knob4_3.value, \trem, knob4_2.value])}.defer(0.2);
			exprand(0.8, 1.5).wait;
		})
	});


	//Play for the Rasp Sound
	btn1.action_{
		{~play1 = Synth(\sg, [\bus, ~busRasp, \vol, (volSliderBox1.value/30), \pan, panSliderBox1.value, \dw, knobr1_1.value, \room, (knobr1_2.value*0.8), \damp, knobr1_3.value, \pos1, knob1_3.value, \pos2, knob1_3.value, \pos3, knob1_3.value, \rate3, knob1_2.value, \curve, knob1_1.value])}.defer(0.2);
	};

	//Play for the Sandpaper Sound
	btn2.action_{
		{~play2 = Synth(\cv, [\bus, ~busSP, \vol, (volSliderBox2.value/2000), \pan, panSliderBox2.value, \dw, knobr2_1.value, \room, (knobr2_2.value*0.8), \damp, knobr2_3.value, \grain, (knob2_2.value)*0.001/2.2, \curve, ((knob2_3.value*16)-8), \trig, ((knob2_1.value*3500)+1500)])}.defer(0.2);
	};

	//Play for the Hammer Sound
	btn3.action_{
		{~play3 = Synth(\mart, [\bus, ~busHammer, \vol, (volSliderBox3.value/3), \pan, panSliderBox3.value, \dw, knobr3_1.value, \room, (knobr3_2.value*0.8), \damp, knobr3_3.value, \pos1, knob3_3.value, \pos2, knob3_3.value, \pos3, knob3_3.value, \rate2, knob3_1.value, \rate3, ((knob3_1.value)-20), \grain2, knob3_2.value])}.defer(0.2);
	};

	//Play for the Pizzicato Sound
	btn4.action_{
		~count = knob4_1.value-1;
		{~play4 = Synth(\pizz, [\bus, ~busPizz, \trig, ~rate.at(~count), \vol, (volSliderBox4.value/10), \pan, panSliderBox4.value, \dw, knobr4_1.value, \room, (knobr4_2.value*0.8), \damp, knobr4_3.value, \pos, knob4_3.value, \trem, knob4_2.value])}.defer(0.2);
	};

	//All Routine actions
	routineBtn1.action_{
		if(routineBtn1.value==1){
			~r1.reset;
			{~r1.play}.defer(0.1);
		};

		if(routineBtn1.value==0){
			~r1.stop;
		}
	};

	routineBtn2.action_{
		if(routineBtn2.value==1){
			~r2.reset;
			{~r2.play}.defer(0.1);
		};

		if(routineBtn2.value==0){
			~r2.stop;
		}
	};

	routineBtn3.action_{
		if(routineBtn3.value==1){
			~r3.reset;
			{~r3.play}.defer(0.1);
		};

		if(routineBtn3.value==0){
			~r3.stop;
		}
	};

	routineBtn4.action_{
		if(routineBtn4.value==1){
			~r4.reset;
			{~r4.play}.defer(0.1);
		};

		if(routineBtn4.value==0){
			~r4.stop;
		}
	};


	//Window refreshing for Dynamic Background
	panSliderBox1.action_{
		w.refresh;
	};

	panSliderBox2.action_{
		w.refresh;
	};

	panSliderBox3.action_{
		w.refresh;
	};

	panSliderBox4.action_{
		w.refresh;
	};


	volSliderBox1.action_{
		w.refresh;
	};

	volSliderBox2.action_{
		w.refresh;
	};

	volSliderBox3.action_{
		w.refresh;
	};

	volSliderBox4.action_{
		w.refresh;
	};


	knob1_1.action_{
		w.refresh;
	};

	knob1_2.action_{
		w.refresh;
	};

	knob1_3.action_{
		w.refresh;
	};

	knobr1_1.action_{
		w.refresh;
	};

	knobr1_2.action_{
		w.refresh;
	};

	knobr1_3.action_{
		w.refresh;
	};


	knob2_1.action_{
		w.refresh;
	};


	knob2_2.action_{
		w.refresh;
	};

	knob2_3.action_{
		w.refresh;
	};

	knobr2_1.action_{
		w.refresh;
	};


	knobr2_2.action_{
		w.refresh;
	};

	knobr2_3.action_{
		w.refresh;
	};


	knob3_1.action_{
		w.refresh;
	};

	knob3_2.action_{
		w.refresh;
	};

	knob3_3.action_{
		w.refresh;
	};

	knobr3_1.action_{
		w.refresh;
	};

	knobr3_2.action_{
		w.refresh;
	};

	knobr3_3.action_{
		w.refresh;
	};

	knob4_1.action_{
		w.refresh;
	};

	knob4_2.action_{
		w.refresh;
	};

	knob4_3.action_{
		w.refresh;
	};

	knobr4_1.action_{
		w.refresh;
	};

	knobr4_2.action_{
		w.refresh;
	};

	knobr4_3.action_{
		w.refresh;
	};


	CmdPeriod.doOnce({w.close});

});


)