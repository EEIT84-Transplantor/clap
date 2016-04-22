		var globalJsonArray;
		//set init organ vaue
		var initValue = 200;
		var globalOrganValueArray = [];
		for (var innd = 0;innd<7;innd++){
			var tempOb = new Object();
			tempOb.oldVP = initValue;
			tempOb.oldVE = initValue;
			globalOrganValueArray.push(tempOb);
		}
		//**********Caca************
		var organOnBodyArray = [0,0,0,0,0,0,0];
		
		//set open background color animation to dark
		$("body").hide();
		$("html").show().animate({
			backgroundColor : '#031014'
		}, 200, "linear", function() {
			$("html").animate({
				backgroundColor : '#062128'
			}, 300, "linear");
			$(document).ready(function() {
				$("body").fadeIn(400);
			});
		});

		//===%%%%===  DOCUMENT READY  ===%%%%=== 
		$(document).ready(function() {
			var environmentIndex = 0;
			//set onclick to change env background
			function initChangeBackClick() {
				$(".factor_item").on("click", function() {
					var src = $(this).find('img').attr('src');
					var bg_img;
					switch (src.substr(39, 1)) {
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
					adjustOrgansWithEnvironment();
					sendAjaxForSim(createFactors());
					$('#fullPage').animate({
						backgroundColor : 'rgb(0,0,0)'
					}, 100, function() {   
						$('#s_wrap').css('backgroundImage', "url("+contextPath+"/resource/images/simulator/"+bg_img+")");
					}).animate({
						backgroundColor : 'rgba(0,0,0,0.1)'
					}, 600);

				});
			}
			
			//*************caca
			function adjustOrgansWithEnvironment(){
				for (var bodyOrganPointer=0; bodyOrganPointer<7;bodyOrganPointer++){
					if (organOnBodyArray[bodyOrganPointer]!=0){
						var valueBox =createValueBox(globalJsonArray, organOnBodyArray[bodyOrganPointer]);
						console.log(globalJsonArray +organOnBodyArray[bodyOrganPointer]);
						adjustOrganBars(valueBox.categoryIndex + 1, valueBox);
						droppingSet(organOnBodyArray[bodyOrganPointer]);
					}
				}
			}
			//use init methods for document
			sendAjaxForSim(createFactors());
			initOrganBars();
			initSaveObject();

			initChangeBackClick();

			
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
			$("#people").droppable({ 
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
				sendAjaxForSim(createFactors());
				clicksetting1 = false;
				//*************caca
				adjustOrgansWithEnvironment();
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
				sendAjaxForSim(createFactors());
				clicksetting2 = false;
				//*************caca
				adjustOrgansWithEnvironment();
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
				sendAjaxForSim(createFactors());
				clicksetting3 = false;
				//*************caca
				adjustOrgansWithEnvironment();
			}).on("mouseout", function() {
				var selectedBar = $(this);
				if (clicksetting3) {
					cleanBar(selectedBar);
				}
			});

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
			//set reset
			$('button[class="reset_btn s_btn2 toreset"').on("click", function() {				
				cleanBar($("#setting1"));
				cleanBar($("#setting2"));
				cleanBar($("#setting3"));
				$("input[name='weight']").val("");
				$("input[name='height']").val("");
				clicksetting1 = true, clicksetting2 = true, clicksetting3 = true;
				//update when rest all factors
				sendAjaxForSim(createFactors());
			})

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

			//set save			
			$('button[class="reset_btn s_btn2 tosave"').on("click", function() {
				var factors = createFactors();
				var index = 1;
				for ( var savedObjKey in saveContainer) {
					var containerLength = Object.keys(saveContainer).length;
					var savedObj = saveContainer[savedObjKey];
					if (savedObj.saved == false) {
						setSaveObject(factors, savedObj);
						savedObj.saved = true;
						$("#saveSlot" + index + " span").attr("class", "glyphicon glyphicon-open");
						//set save slot icon
						$("#saveSlot" + index).on("mouseover", function() {
							$("#saveSlot" + index + " span").attr("class", "glyphicon glyphicon-hand-up");
						}).on("mouseout", function() {
							$("#saveSlot" + index + " span").attr("class", "glyphicon glyphicon-open");
						});
						//set retrieval from save slot
						$("#saveSlot" + index).css("opacity", "1").on("click", function() {
							var tempObj = saveContainer["save" + index];
							regenerateFromSave(tempObj);
						});
						break;
					}
					if (index == containerLength) {
						alert("no more to save");
					}
					index++;
				}
				$("button.toclear").on("click", function() {
					initSaveObject();
					for (var index = 1; index <= 3; index++) {
						$("#saveSlot" + index + " span").attr("class", "");
						//clear save slot icon
						$("#saveSlot" + index).css("opacity", "0.5").off("mouseover").off("mouseout").off("click");
					}
				})

				for ( var savedObjKey in saveContainer) {
					var savedObj = saveContainer[savedObjKey];
					printObject(savedObj);
				}

			});

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
				}).animate({
					backgroundColor : 'rgba(0,0,0,0.1)'
				}, 600);
			}
			function regenerateFromSave(savedObjectToBack) {
				drawBarToPercent($("#setting1"), savedObjectToBack.smoking);
				drawBarToPercent($("#setting2"), savedObjectToBack.drinking);
				drawBarToPercent($("#setting3"), savedObjectToBack.exercising);
				$("input[name='weight']").val(savedObjectToBack.weight);
				$("input[name='height']").val(savedObjectToBack.height);
				setEnvironmentBG(savedObjectToBack.env_id, savedObjectToBack);
			}

			//Ajax send when enter or change Environment 
			function sendAjaxForSim(sentDataObj) {

				printObject(sentDataObj);
				$.ajax({
					url : urlToSend,
					data : sentDataObj
				}).done(function(msg) {
					console.log("updates acquired");
					var newJsonObject = parseJSONText(msg);		
					globalJsonArray = newJsonObject;
					updateAllValues(newJsonObject);
				});
			}

			//set organ bars original
			function initOrganBars() {
				$("span.o_old").css("width", initValue+50+"px");
				$("span.o_new").css("width", initValue+50+"px");				
			}



			//add onmouseover onmouseout to organs
			function updateAllValues(jsonarrayToUpdate){     
			for (var iii = 1; iii < 799; iii++) {
				var existIndex = $("img[name='product" + iii + "']").attr("name"); 
				if(existIndex !== undefined){
				$("img[name='product" + iii + "']").off("mouseover", function() {
				}).off("mouseout", function() {					
				});
				
				$("img[name='product" + iii + "']").on("mouseover", function() {
					var productId = $(this).attr("name");  
					var valueBox = createValueBox(jsonarrayToUpdate, productId);
					
					//start bar animation
					adjustOrganBars(valueBox.categoryIndex + 1, valueBox);
				}).on("mouseout", function() {
					var productId = $(this).attr("name"); 
					resetOrganBars();
					
				});
				} 
			}
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
				var oldValueP = valueBoxforAdjust.oldVP + adjustBase-1;
				var newValueP = valueBoxforAdjust.newVP + adjustBase-1;
				var oldValueE = valueBoxforAdjust.oldVE + adjustBase-1;
				var newValueE = valueBoxforAdjust.newVE + adjustBase-1;
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
				console.log("hihi createValueBox");
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
				console.log(categoryIndex);
				organOnBodyArray[categoryIndex] = productId;

			}
			
		});//===%%%%===  END of DOCUMENT READY  ===%%%%=== 

		//init document save objects
		function initSaveObject() {
			saveObject1 = new Object(), saveObject2 = new Object(), saveObject3 = new Object();
			saveContainer = new Object;
			saveObject1.saved = false;
			saveObject2.saved = false;
			saveObject3.saved = false;
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
