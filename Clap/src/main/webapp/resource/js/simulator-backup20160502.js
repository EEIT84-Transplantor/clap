		var globalJsonArray;
		//set init organ vaue
		var initValue = 200;
		var globalOrganValueArray = [];
		initGlobalOrganValueArray();
		function initGlobalOrganValueArray(){
			globalOrganValueArray = [];
			for (var innd = 0;innd<7;innd++){
				var tempOb = new Object();
				tempOb.oldVP = initValue;
				tempOb.oldVE = initValue;
				globalOrganValueArray.push(tempOb);
			}
		}
		//**********Caca************
		var organOnBodyArray = [0, 0, 0, 0, 0, 0, 0];
		
		//set Basic Pack
		function setBasicPack(){
			for(var goIndex = 1; goIndex <8; goIndex++){
				organOnBodyArray.push('product' + goIndex + '1');
			}	
		}
		
		//set open background color animation to dark
		$("body").hide();		
		$("html").show().animate({
			backgroundColor : '#031014'
		}, 200, "linear", function() {
			$("html").animate({
				backgroundColor : '#062128'
			}, 300, "linear");			
		});

		//===%%%%===  DOCUMENT READY  ===%%%%=== 
		$(window).load(function() {			
			var environmentIndex = 0;
			
			//use init methods for document			
			initAjaxForSim(createFactors());
			initOrganBars();
			initSaveObject();
			initChangeBackClick();
			initOnEvents();
			
			
			//set onclick to change env background
			function initChangeBackClick() {
				$(".factor_item").on("click", function() {
					var src = $(this).find('img').attr('src');
					
					var bg_img;
					console.log("bg_imghahahhhhhhhh"+src.substr(src.lastIndexOf(".png")-1, 1));
					var indexOfEnviron = src.substr(src.lastIndexOf(".png")-1, 1);
					switch (indexOfEnviron) {
					case "1":
						bg_img = "s_bg_1.png";
						environmentIndex = 1;
						break;
					case "2":
						bg_img = "s_bg_2.png";
						environmentIndex = 2;
						break;
					case "3":
						bg_img = "s_bg_3.png";
						environmentIndex = 3;
						break;
					case "4":
						bg_img = "none";
						environmentIndex = 0;
					}
					//*************caca
					//adjustOrgansWithEnvironment();

					
					$('#fullPage').animate({
						backgroundColor : 'rgb(0,0,0)'
					}, 100, function() {   
						$('#s_wrap').css('backgroundImage', "url("+contextPath+"/resource/images/simulator/"+bg_img+")");
						if(environmentIndex != 0){
							$("h2").animate({color:'#000000'});
//							$("a[data-toggle='tab']").animate({color:'#000000'});
						}else{
							$("h2").animate({color:'#47BED9'});
//							$("a[data-toggle='tab']").animate({color:'#47BED9'});
						}
					});
					sendAjaxForSim(createFactors());

				});
			}
			
			//shading background
			function bgTransition(){
				$('#fullPage').animate({
					backgroundColor : 'rgb(0,0,0)'
				}, 10, function() {				
					
				});
			}
			
			//*************caca
			function adjustOrgansWithEnvironment(){
				for (var bodyOrganPointer=0; bodyOrganPointer<7;bodyOrganPointer++){
					if (organOnBodyArray[bodyOrganPointer]!=0){
						var valueBox =createValueBox(globalJsonArray, organOnBodyArray[bodyOrganPointer]);
						console.log(globalJsonArray + organOnBodyArray[bodyOrganPointer]);
						adjustOrganBars(valueBox.categoryIndex + 1, valueBox);
						droppingSet(organOnBodyArray[bodyOrganPointer]);
					}else{
//						var valueBox = new Object();
//						valueBox.oldVP = globalOrganValueArray[bodyOrganPointer].oldVP;
//						valueBox.newVP = initValue;
//						valueBox.oldVE = globalOrganValueArray[bodyOrganPointer].oldVE;
//						valueBox.newVE = initValue;
//						adjustOrganBars(bodyOrganPointer + 1, valueBox);
					}
				}
			}
			
			//init ajax for sim 
			function initAjaxForSim(sentDataObj) {

				printObject(sentDataObj);
				$.ajax({
					method: "POST",
					url : urlToSend,
					data : sentDataObj
				}).done(function(msg) {
					console.log("updates acquired");
					var newJsonObject = parseJSONText(msg);		
					globalJsonArray = newJsonObject;
					updateAllValues(newJsonObject);
					$("body").fadeIn(400);
				});
			}
			function initOnEvents(){
				//set add cart
				$("#s_organs_r").on("click", function(){
					addingToCart();
				});
				
				//set dragging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
				$(".carousel").carousel("pause");
				for(var i = 0;i<=7;i++){
					var temp = ".draggable"+i;
					$(temp).draggable({ 
						helper: 'clone',
						cursor: "crosshair", 
						revert: "invalid",
						appendTo: 'body'
					});
				}
				$("#pp_gb").droppable({ 
						   accept: $(".p_drag"), 
				           drop: function(event, ui) {
				        	   var dropped = ui.draggable;
				        	   i = $(dropped).attr("categoryID");
					           var droppedOn = $("#o_"+i);
					           $(droppedOn).html("");
					           $(droppedOn).append($(dropped).clone());				           
					           droppingSet($(dropped).attr("name"));
				          }
				});
					
				

				//setting of smoking, alcohol, and sport
				var clicksetting1 = true, clicksetting2 = true, clicksetting3 = true;
				$("#setting1").on("mousemove", function(event) {
					var selectedBar = $(this);
					if (clicksetting1) {
						drawBar(selectedBar);
					}
				}).on("click", function() {
					bgTransition();
					sendAjaxForSim(createFactors());
					clicksetting1 = false;
					//*************caca
					//adjustOrgansWithEnvironment();
				}).on("mouseout", function() {
					var selectedBar = $(this);
					if (clicksetting1) {
						cleanBar(selectedBar);
					}
				});

				$("#setting2").on("mousemove", function() {
					var selectedBar = $(this);
					if (clicksetting2) {
						drawBar(selectedBar);
					}
				}).on("click", function() {
					bgTransition();
					sendAjaxForSim(createFactors());
					clicksetting2 = false;
					//*************caca
					//adjustOrgansWithEnvironment();
				}).on("mouseout", function() {
					var selectedBar = $(this);
					if (clicksetting2) {
						cleanBar(selectedBar);
					}
				});

				$("#setting3").on("mousemove", function() {
					var selectedBar = $(this);
					if (clicksetting3) {
						drawBar(selectedBar);
					}
				}).on("click", function() {
					bgTransition();
					sendAjaxForSim(createFactors());
					clicksetting3 = false;
					//*************caca
					//adjustOrgansWithEnvironment();
				}).on("mouseout", function() {
					var selectedBar = $(this);
					if (clicksetting3) {
						cleanBar(selectedBar);
					}
				});
				
				//set reset
				$('button[class="reset_btn toreset"').on("click", function() {	
					//reset settings and height weight
					cleanBar($("#setting1"));
					cleanBar($("#setting2"));
					cleanBar($("#setting3"));
					$("input[name='weight']").val("");
					$("input[name='height']").val("");
					clicksetting1 = true, clicksetting2 = true, clicksetting3 = true;
					//reset organs pictures and organ array and saveContainer
					$("div.drop").fadeOut(300, function(){
						$("div.drop").html("");
						$("div.drop").show();
					});
					organOnBodyArray = [0, 0, 0, 0, 0, 0, 0];
					initGlobalOrganValueArray();
					//use reset values to change organ bars
					resetOrganBars();
					//update when reset all factors
					setEnvironmentBG(0, createFactors());
				});
				
				//set save			
				$('button[class="reset_btn s_btn2 tosave btn_4"').on("click", function() {
					var factors = createFactors();
					var index = 1;
					for ( var savedObjKey in saveContainer) {
						var containerLength = Object.keys(saveContainer).length;
						var savedObj = saveContainer[savedObjKey];
						if (savedObj.saved == false) {
							//save to page saveContainer
							setSaveObject(factors, savedObj);
							savedObj.saved = true;
							for (var kk in organOnBodyArray){
								savedObj.pack.push(organOnBodyArray[kk]);
							}
							//send save ajax
							sendAjaxForSave();
							//set save slot icon
							$("#saveSlot" + index + " span").attr("class", "glyphicon glyphicon-open");
							//set slot icon hover
							$("#saveSlot" + index).on("mouseover", function() {
								$("#saveSlot" + index + " span").attr("class", "glyphicon glyphicon-hand-up");
							}).on("mouseout", function() {
								$("#saveSlot" + index + " span").attr("class", "glyphicon glyphicon-open");
							});
							//set retrieval from save slot
							$("#saveSlot" + index).css("opacity", "1").on("click", function() {
								var tempObj = saveContainer["save" + index];	
								regenerateFromSave(tempObj);
								$("div.drop").fadeOut(250);
								$("div.drop").first().fadeOut(250, function(){
									recoverBodyOrgans(index);
								});			
							});
							break;
						}
						if (index == containerLength) {
							alert("no more to save");
						}
						index++;
					}
					//set clear saves button
					$("button.toclear").on("click", function() {
						initSaveObject();
						for (var index = 1; index <= 3; index++) {
							$("#saveSlot" + index + " span").attr("class", "");
							//clear save slot icon
							$("#saveSlot" + index).css("opacity", "0.5").off("mouseover").off("mouseout").off("click");
						}
					})

					//print saving status
					for ( var savedObjKey in saveContainer) {
						var savedObj = saveContainer[savedObjKey];
						printObject(savedObj);
					}

				});
			}
				
			

			function drawBar(selectedBar) {
				var offset = selectedBar.offset();
				var width = selectedBar.width();
				var percent = (event.pageX - offset.left) / width;
				percent = 100 * percent;
				selectedBar.css({
					"background" : "-webkit-linear-gradient(left, #C13F2E " + percent + "%, rgba(0,0,0,0) " + percent + "%)",
					"background" : "  -moz-linear-gradient(left, #C13F2E " + percent + "%, rgba(0,0,0,0) " + percent + "%)",
					"background" : "   -ms-linear-gradient(left, #C13F2E " + percent + "%,rgba(0,0,0,0) " + percent + "%)",
					"background" : "    -o-linear-gradient(left, #C13F2E " + percent + "%,rgba(0,0,0,0) " + percent + "%)",
					"background" : "      linear-gradient(to right, #C13F2E " + percent + "%,rgba(0,0,0,0) " + percent + "%)"
				});
			}
			function drawBarToPercent(selectedBar, percent) {
				selectedBar.css({
					"background" : "-webkit-linear-gradient(left, #C13F2E " + percent + "%, rgba(0,0,0,0) " + percent + "%)",
					"background" : "  -moz-linear-gradient(left, #C13F2E " + percent + "%, rgba(0,0,0,0) " + percent + "%)",
					"background" : "   -ms-linear-gradient(left, #C13F2E " + percent + "%,rgba(0,0,0,0) " + percent + "%)",
					"background" : "    -o-linear-gradient(left, #C13F2E " + percent + "%,rgba(0,0,0,0) " + percent + "%)",
					"background" : "      linear-gradient(to right, #C13F2E " + percent + "%,rgba(0,0,0,0) " + percent + "%)"
				});
			}
			function cleanBar(selectedBar) {
				selectedBar.css({
					"background" : "-webkit-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
					"background" : "  -moz-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
					"background" : "   -ms-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
					"background" : "    -o-linear-gradient(left, #C13F2E 0%, rgba(0,0,0,0) 0%)",
					"background" : "      linear-gradient(to right, #C13F2E 0%, rgba(0,0,0,0) 0%)"
				});
			}
			

			//create factors
			function createFactors() {
				var factors = new Object();
				var tempAttr = $("#setting1").css("background");
				var index = tempAttr.indexOf('%)', 0);
				tempAttr = tempAttr.substring(0, index);
				tempAttr = tempAttr.substring(tempAttr.lastIndexOf(')') + 1);
				var temp = parseInt(tempAttr);
				if (index == -1) {
					factors.smoking = 0;
				} else {
					factors.smoking = temp;
				}
				var tempAttr = $("#setting2").css("background");
				var index = tempAttr.indexOf('%)', 0);
				tempAttr = tempAttr.substring(0, index);
				tempAttr = tempAttr.substring(tempAttr.lastIndexOf(')') + 1);
				var temp = parseInt(tempAttr);
				if (index == -1) {
					factors.drinking = 0;
				} else {
					factors.drinking = temp;
				}
				var tempAttr = $("#setting3").css("background");
				var index = tempAttr.indexOf('%)', 0);
				tempAttr = tempAttr.substring(0, index);
				tempAttr = tempAttr.substring(tempAttr.lastIndexOf(')') + 1);
				var temp = parseInt(tempAttr);
				if (index == -1) {
					factors.exercising = 0;
				} else {
					factors.exercising = temp;
				}
				var weight = $("input[name='weight']").val();
				var height = $("input[name='height']").val();
				weight = (weight == "") ? 60 : (weight > 300) ? 300 : (weight < 10) ? 10 : weight;
				height = (height == "") ? 175 : (height > 300) ? 300 : (height < 50) ? 50 : height;
				$("input[name='height']").val(height);
				$("input[name='weight']").val(weight);
				factors.weight = weight;
				factors.height = height;
				factors.env_id = environmentIndex;
				return factors;
			}



			function setEnvironmentBG(tempEnvIndex, ajaxDataObj) {
				var bg_img;
				console.log("set");
				sendAjaxForSim(ajaxDataObj);
				switch (tempEnvIndex) {
				case 1:
					bg_img = "s_bg_1.png";
					environmentIndex = 1;
					break;
				case 2:
					bg_img = "s_bg_2.png";
					environmentIndex = 2;

					break;
				case 3:
					bg_img = "s_bg_3.png";
					environmentIndex = 3;
					break;
				case 0:
					bg_img = "none";
					environmentIndex = 0;
				}
			
		
				$('#fullPage').animate({
					backgroundColor : 'rgb(0,0,0)'
				}, 100, function() {
					$('#s_wrap').css('backgroundImage', "url("+contextPath+"/resource/images/simulator/"+bg_img+")");
					if(environmentIndex != 0){
						$("h2").animate({color:'#000000'});
//						$("a[data-toggle='tab']").animate({color:'#000000'});
					}else{
						$("h2").animate({color:'#47BED9'});
//						$("a[data-toggle='tab']").animate({color:'#47BED9'});
					}
				});
			}
			function regenerateFromSave(savedObjectToBack) {
				drawBarToPercent($("#setting1"), savedObjectToBack.smoking);
				drawBarToPercent($("#setting2"), savedObjectToBack.drinking);
				drawBarToPercent($("#setting3"), savedObjectToBack.exercising);
				$("input[name='weight']").val(savedObjectToBack.weight);
				$("input[name='height']").val(savedObjectToBack.height);
				setEnvironmentBG(savedObjectToBack.env_id, savedObjectToBack);
			}

			
			
			//set organ bars original
			function initOrganBars() {
				$("span.o_old").css("width", initValue+50+"px");
				$("span.o_new").css("width", initValue+49+"px");				
			}



			//add onmouseover onmouseout to organs
			function updateAllValues(jsonarrayToUpdate){     
			  for (var iii = 1; iii < 799; iii++) {
				var existIndex = $("img[name='product" + iii + "']").attr("name"); 
				if(existIndex !== undefined){
					$("img[name='product" + iii + "']").off("mouseover")
					.on("mouseover", function() {
						var productId = $(this).attr("name");  
						var valueBox = createValueBox(jsonarrayToUpdate, productId);

						//start bar animation
						adjustOrganBars(valueBox.categoryIndex + 1, valueBox);
					}).off("mouseout")
					.on("mouseout", function() {
						var productId = $(this).attr("name"); 
						resetOrganBars();
						
					});				
				} 
			  }
			  adjustOrgansWithEnvironment();
			}
			
			//reset organ bar to old values
			function resetOrganBars(){
				var valueBox = new Object();
				
				//start bar animation
				for(var resetIndex = 1 ; resetIndex<8;resetIndex++){
				valueBox.oldVP = globalOrganValueArray[resetIndex-1].oldVP;
				valueBox.newVP = globalOrganValueArray[resetIndex-1].oldVP;
				valueBox.oldVE = globalOrganValueArray[resetIndex-1].oldVE;
				valueBox.newVE = globalOrganValueArray[resetIndex-1].oldVE;
				adjustOrganBarsMultiTread(resetIndex, valueBox);
				}
			}
			
			//function to adjust designated organ bar
			function adjustOrganBars(index, valueBoxforAdjust) {
				//stop previous animation
				$("span.o_old").stop();
				$("span.o_new").stop();	
				//set moving delta
				var adjustBase = 50;
				//calculate bar length
				var oldValueP = valueBoxforAdjust.oldVP + adjustBase;
				var newValueP = valueBoxforAdjust.newVP + adjustBase;
				var oldValueE = valueBoxforAdjust.oldVE + adjustBase;
				var newValueE = valueBoxforAdjust.newVE + adjustBase;
				//check if old value greater
				var reverseP = (oldValueP > newValueP) ? true : false;
				var reverseE = (oldValueE > newValueE) ? true : false;
				//set animation duration
				var animationSpeed = 450;

				
				if (reverseP) {
					$("span[class='o_old organ" + index + "']").eq(0).css("z-index", "3").animate({
						width : oldValueP + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(0).css("z-index", "5").animate({
						width : newValueP + 'px'
					}, animationSpeed);
				} else {
					$("span[class='o_old organ" + index + "']").eq(0).css("z-index", "5").animate({
						width : oldValueP + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(0).css("z-index", "3").animate({
						width : newValueP + 'px'
					}, animationSpeed);

				}

				if (reverseE) {
					$("span[class='o_old organ" + index + "']").eq(1).css("z-index", "3").animate({
						width : oldValueE + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(1).css("z-index", "5").animate({
						width : newValueE + 'px'
					}, animationSpeed);
				} else {
					$("span[class='o_old organ" + index + "']").eq(1).css("z-index", "5").animate({
						width : oldValueE + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(1).css("z-index", "3").animate({
						width : newValueE + 'px'
					}, animationSpeed);

				}
			}
			//multiple organ bar adjust
			function adjustOrganBarsMultiTread(index, valueBoxforAdjust) {				
				//set moving delta
				var adjustBase = 50;
				//calculate bar length
				var oldValueP = valueBoxforAdjust.oldVP + adjustBase-1;
				var newValueP = valueBoxforAdjust.newVP + adjustBase-1;
				var oldValueE = valueBoxforAdjust.oldVE + adjustBase-1;
				var newValueE = valueBoxforAdjust.newVE + adjustBase-1;
				//check if old value greater
				var reverseP = (oldValueP > newValueP) ? true : false;
				var reverseE = (oldValueE > newValueE) ? true : false;
				//set animation duration
				var animationSpeed = 300;
				$("span[class='o_old organ" + index + "']").stop();
				$("span[class='o_new organ" + index + "']").stop();	
				
				if (reverseP) {
					$("span[class='o_old organ" + index + "']").eq(0).css("z-index", "3").animate({
						width : oldValueP + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(0).css("z-index", "5").animate({
						width : newValueP + 'px'
					}, animationSpeed);
				} else {
					$("span[class='o_old organ" + index + "']").eq(0).css("z-index", "5").animate({
						width : oldValueP + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(0).css("z-index", "3").animate({
						width : newValueP + 'px'
					}, animationSpeed);

				}

				if (reverseE) {
					$("span[class='o_old organ" + index + "']").eq(1).css("z-index", "3").animate({
						width : oldValueE + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(1).css("z-index", "5").animate({
						width : newValueE + 'px'
					}, animationSpeed);
				} else {
					$("span[class='o_old organ" + index + "']").eq(1).css("z-index", "5").animate({
						width : oldValueE + 'px'
					}, animationSpeed);
					$("span[class='o_new organ" + index + "']").eq(1).css("z-index", "3").animate({
						width : newValueE + 'px'
					}, animationSpeed);

				}
			}
			function createValueBox(jsonarrayToUpdate, productId){
				if (jsonarrayToUpdate === undefined){
					jsonarrayToUpdate = globalJsonArray;
				}
// 		        alert(jsonarrayToUpdate[0].productVOs[0].name);
		        var valueBox = new Object();
		        var categoryIndex = parseInt(productId.substring(7, 8)) - 1;
				var productIndex = parseInt(productId.substring(8)) - 1;
				var tempProductVO = jsonarrayToUpdate[categoryIndex].productVOs[productIndex];
				var tempPower = parseFloat(tempProductVO.finalValue1) -1;
				var tempEndur = parseFloat(tempProductVO.finalValue2) -1;
				valueBox.categoryIndex = categoryIndex;
		        valueBox.oldVP = globalOrganValueArray[categoryIndex].oldVP;
				valueBox.newVP = initValue + tempPower*100;
				valueBox.oldVE = globalOrganValueArray[categoryIndex].oldVE;
				valueBox.newVE = initValue + tempEndur*100;
				return valueBox;
			}
			
			//fix baseline when dropping
			function droppingSet(productId){
				var categoryIndex = parseInt(productId.substring(7, 8)) - 1;
				var productIndex = parseInt(productId.substring(8)) - 1;
				var valueBox = createValueBox(globalJsonArray, productId);
				globalOrganValueArray[categoryIndex].oldVP = valueBox.newVP;
				globalOrganValueArray[categoryIndex].oldVE = valueBox.newVE;
				resetOrganBars();
				
				
				//**************Caca*********
				//store the products that are on the body into a organOnBodyArray list 
				organOnBodyArray[categoryIndex] = productId;
				console.log("Current dropped organs: [" + organOnBodyArray + "]");
			}
			
			//recover body organs
			function recoverBodyOrgans(savingSlotIndex){
				var packToRecover = saveContainer["save"+savingSlotIndex].pack;
				for(var iiii=0;iiii<7;iiii++){
					var productId = packToRecover[iiii]
					if(productId !== 0){
						var tempImg64 = $("img[name='"+productId+"']").attr("src");
						$("#o_"+(iiii+1)).html("<img>");
						$("#o_"+(iiii+1)+" img").attr("name", productId).attr("class", "p_drag draggable3 ui-draggable ui-draggable-handle")
						.attr("categoryid",productId.substring(7,8))
						.attr("src", tempImg64);
						organOnBodyArray[iiii] = productId;
					}else{
						$("#o_"+(iiii+1)).html("");
						organOnBodyArray[iiii] = 0;
					}
				}
				$("div.drop").fadeIn(350);
			}
			//add to cart
		    function addingToCart() {		    	
		    	var firstSend = true;
		    	var productCount = 0;

		    	for (var bodyIndex = 6;bodyIndex >= 0;bodyIndex--){
		    		if(organOnBodyArray[bodyIndex] !== 0){
		    			if(bodyIndex == 0){
		    				setTimeoutToGo(firstSend, 0);
		    			}else if(bodyIndex == 1){
		    				setTimeoutToGo(firstSend, 1);
		    			}else if(bodyIndex == 2){
		    				setTimeoutToGo(firstSend, 2);
		    			}else if(bodyIndex == 3){
		    				setTimeoutToGo(firstSend, 3);
		    			}else if(bodyIndex == 4){
		    				setTimeoutToGo(firstSend, 4);
		    			}else if(bodyIndex == 5){
		    				setTimeoutToGo(firstSend, 5);
		    			}else if(bodyIndex == 6){
		    				setTimeoutToGo(firstSend, 6);
		    			}
		    			
		    		}		    		
		    	}
			}
		    //
		    function setTimeoutToGo(firstSend, ii){
		    	var lastIndex = 0;
		    	if(firstSend){
    				lastIndex = ii + 1;
    			}		    			
    			setTimeout(function(){
    				var pdIdtoSent = organOnBodyArray[ii].substring(7);
    				sendAjaxToCart(pdIdtoSent, lastIndex);
    			}, 20 * ii + 1);
    			firstSend = false;
    			return lastIndex;
		    }
		    
		    //ajaxLoader showing
		    function showAjaxLoader(){
		    	
		    	var targetDiv = $("div.opacityDiv");
		    	var width = targetDiv.width();
		    	var height = targetDiv.height();
		    	
		    	var position = targetDiv.position();
		    	var top = position.top + height/2;
		    	var left = position.left + width*40/100;
		    	
		    	$("#ajaxloader").css({
		    		"position":"absolute",
		    		"top":top,
		    		"left":left
		    	});
		    	$("#ajaxloader").show();
		    }
		    //ajaxLoader hiding
		    function hideAjaxLoader(){
		    	$("#ajaxloader").hide();
		    }

		    //Ajax send when enter or change Environment 
			function sendAjaxForSim(sentDataObj) {
				
				showAjaxLoader();
				printObject(sentDataObj);
				$.ajax({
					method: "POST",
					url : urlToSend,
					data : sentDataObj
				}).done(function(msg) {
					console.log("updates acquired");
					$('#fullPage').animate({
						backgroundColor : 'rgba(0,0,0,0.1)'
					}, 600);
					var newJsonObject = parseJSONText(msg);		
					globalJsonArray = newJsonObject;
					updateAllValues(newJsonObject);
					hideAjaxLoader();
				});
			}
			
			//Ajax send when save or clear saves 
			function sendAjaxForSave() {
				for(var indexS = 3;indexS>0; indexS--){
					var sentSave = saveContainer["save" + indexS];		
						if(sentSave.saved){
							var sentDataObj = new Object();
							sentDataObj["pack" + indexS] = [];
							var sentDataObjPackArray = sentDataObj["pack" + indexS];
							sentDataObjPackArray.push(999);
							for(var indexPack = 0; indexPack<7;indexPack++){
								if(sentSave.pack[indexPack] !== 0){
									var productId =  parseInt(sentSave.pack[indexPack].substring(7));
									sentDataObjPackArray.push(productId);
								}else{
									sentDataObjPackArray.push(0);
								}							
							}
							
							var toSentJson = JSON.stringify(sentDataObj);
							console.log(toSentJson);
							console.log("send to save pack");
							$.ajax({
								method: "POST",
								url : contextPath + "/simulator/savePackAction",
								data : toSentJson,
								contentType:"application/json"
							}).done(function(msg) {
								console.log("saved");
								console.log("msg: " + msg);					
							}).fail(function(msg){
								console.log("failed");
								console.log("msg: " + msg);		
							});
							break;
						}
					

				}				
			}
		    
		    //send ajax to cart
		    function sendAjaxToCart(productIdToSend, lastIndex){
		    	var urlToCart = contextPath + "/shopping/setCart.action";
		    	var cartData = {"cartVO.product_id": productIdToSend};
		    	console.log("send cart productId: " + productIdToSend);
		    	$.ajax({
		    		method:"POST",
		    		url:urlToCart,
		    		data:cartData
		    	}).done(function(msg){
		    		console.log(msg);
		    		$(".cart_anchor").text(msg);
		    	});
		    	var categoryIndex = parseInt(productIdToSend.substring(0,1));
	    		if(categoryIndex == lastIndex){
		            //Select item image and pass to the function
		    		$('html, body').animate({
			           'scrollTop' : $(".cart_anchor").position().top
			        });
		    		var flyDiv = $("#o_"+productIdToSend.substring(0,1));
		    		var flyImg = flyDiv.find("img");
		    		flyToElement(flyImg, $('.cart_anchor'));
	    		}
		    }
			
		});//========================%%%%===  END of DOCUMENT READY  ===%%%%======================== 

		//init document save objects
		function initSaveObject() {
			saveObject1 = new Object(), saveObject2 = new Object(), saveObject3 = new Object();
			saveContainer = new Object;
			saveObject1.saved = false;
			saveObject2.saved = false;
			saveObject3.saved = false;
			saveObject1.pack = [];
			saveObject2.pack = [];
			saveObject3.pack = [];
			saveContainer.save1 = saveObject1;
			saveContainer.save2 = saveObject2;
			saveContainer.save3 = saveObject3;
			$("#saveSlot1 span").attr("class", "");
			$("#saveSlot2 span").attr("class", "");
			$("#saveSlot3 span").attr("class", "");
		}

		function setSaveObject(sourceObj, targetObject) {
			for ( var key in sourceObj) {
				targetObject[key] = sourceObj[key];
			}
		}

		function printObject(printedObj) {
			for ( var key in printedObj) {
				console.log("[" + key + "]: " + printedObj[key]);
			}
		}


		//get all products when init

		function parseJSONText(JsonString) {
			return JSON.parse(JsonString);
		}
