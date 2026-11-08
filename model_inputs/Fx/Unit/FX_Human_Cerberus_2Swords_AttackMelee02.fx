{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Knife01",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"y": -0.11946,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Knife02",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"x": -0.10327,
							"y": 0.13531,
							"rotationX": -90,
							"rotationZ": -166.5
						},
						{
							"type": "model",
							"name": "Male01_HouseGuard",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Anim/Male01/Cerberus_2Swords/Anim_Male01_Cerberus_2Swords_AttackMelee02.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Attack",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 0.9,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.9,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 5,
								"emitAngle": 45,
								"alignMode": "Screen",
								"lifeTime": 4.5,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"speedFactor": 2.5,
								"maxCount": 4,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"warmUpTime": -1.75,
								"emitType": "Burst",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									5,
									0,
									0
								],
								"burstDelay": 0.75
							},
							"x": 4.90064,
							"y": 1.26905,
							"z": -0.92916,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.1,
							"rotationZ": 28.9,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.25,
									"scaleY": 2.25,
									"scaleZ": 2.25,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6472728746925278,
																"dt": -0.012445056058803479
															},
															"nextHandle": {
																"dv": 0.9454545454545454,
																"dt": 0.007142857142857143
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.922912650454184e-17,
																"dt": -0.21499999999999997
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.36
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01694444444444443,
																"dt": -0.27
															},
															"nextHandle": {
																"dv": 0.013434004892663146,
																"dt": 0.21406315992899264
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.07,
													-0.05
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1116321015082125,
																"dt": -0.3076091494743911
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.2774350174349862
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.7,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.57,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.6,
											"envBlend": 0.5
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0967980860793232,
												"dt": -0.009802037467223067
											},
											"nextHandle": {
												"dv": 0.5569361461292616,
												"dt": 0.0049999999999999975
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0.010970089074337164,
												"dt": -0.575
											},
											"nextHandle": {
												"dv": -0.006359231507065358,
												"dt": 0.3333207316535249
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.0890297805850073,
												"dt": -0.11575828486016804
											},
											"nextHandle": {
												"dv": -0.9363636363636363,
												"dt": 0.03508928571428571
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.009090909090909038,
												"dt": -0.6245892857142856
											},
											"nextHandle": {
												"dv": 0.008774267419493307,
												"dt": 0.6028344762228577
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Slash01",
							"x": 2.44187,
							"y": -0.00894,
							"z": 2.34275,
							"rotationX": -175.5,
							"rotationY": 5.1000000000000005,
							"rotationZ": -48.50000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.21673611111111152,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.4561111111111062,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.21173611111111157,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.6767361111111114,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.0917361111111115,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.6181942490123042,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6281942490123043,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.644297540131737,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.654297540131737,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashImpact",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6562551495226696,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6662551495226696,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6762551495226696,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.7517361111111114,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.21673611111111152,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.4561111111111062,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.21173611111111157,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.6767361111111114,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.0917361111111115,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Slash02",
							"x": 2.44187,
							"y": -0.00894,
							"z": 2.34275,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 149.79999999999998,
							"rotationY": 5.100000000000001,
							"rotationZ": -48.50000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.39006944444444486,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.6294444444444396,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3850694444444449,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.8500694444444448,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.2650694444444448,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.7992189796526017,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8092189796526017,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8253222707720345,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8353222707720345,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashImpact",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.829588482856003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.839588482856003,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.849588482856003,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.9250694444444445,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.39006944444444486,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.6294444444444396,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3850694444444449,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.8500694444444448,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.2650694444444448,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Backup",
					"enabled": false,
					"y": -8.80536,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 0.9,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.9,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 5,
								"emitAngle": 45,
								"alignMode": "Screen",
								"lifeTime": 4.5,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"speedFactor": 2.5,
								"maxCount": 4,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"warmUpTime": -1.75,
								"emitType": "Burst",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									5,
									0,
									0
								],
								"burstDelay": 0.75
							},
							"x": 4.90064,
							"y": 1.26905,
							"z": -0.92916,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.1,
							"rotationZ": 28.9,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.25,
									"scaleY": 2.25,
									"scaleZ": 2.25,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6472728746925278,
																"dt": -0.012445056058803479
															},
															"nextHandle": {
																"dv": 0.9454545454545454,
																"dt": 0.007142857142857143
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.922912650454184e-17,
																"dt": -0.21499999999999997
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.36
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01694444444444443,
																"dt": -0.27
															},
															"nextHandle": {
																"dv": 0.013434004892663146,
																"dt": 0.21406315992899264
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.07,
													-0.05
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1116321015082125,
																"dt": -0.3076091494743911
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.2774350174349862
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.7,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.57,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.6,
											"envBlend": 0.5
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0967980860793232,
												"dt": -0.009802037467223067
											},
											"nextHandle": {
												"dv": 0.5569361461292616,
												"dt": 0.0049999999999999975
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0.010970089074337164,
												"dt": -0.575
											},
											"nextHandle": {
												"dv": -0.006359231507065358,
												"dt": 0.3333207316535249
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.0890297805850073,
												"dt": -0.11575828486016804
											},
											"nextHandle": {
												"dv": -0.9363636363636363,
												"dt": 0.03508928571428571
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.009090909090909038,
												"dt": -0.6245892857142856
											},
											"nextHandle": {
												"dv": 0.008774267419493307,
												"dt": 0.6028344762228577
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Slash01",
							"x": 2.44187,
							"y": -0.00894,
							"z": 2.34275,
							"rotationX": -175.5,
							"rotationY": 5.1,
							"rotationZ": -48.5,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.21673611111111152,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.4561111111111062,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.21173611111111157,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.6767361111111114,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.0917361111111115,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashImpact",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6562551495226696,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6662551495226696,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6762551495226696,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.7517361111111114,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.21673611111111152,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.4561111111111062,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.21173611111111157,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.6767361111111114,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.0917361111111115,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashContrast",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.617060784237049,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.627060784237049,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6515121941471536,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6615121941471536,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.7517361111111114,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.21673611111111152,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.4561111111111062,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.21173611111111157,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.6767361111111114,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.0917361111111115,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashDistort",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.006
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.21673611111111152,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.4561111111111062,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.21173611111111157,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.6767361111111114,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.0917361111111115,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Slash01",
							"x": 2.44187,
							"y": -0.00894,
							"z": 2.34275,
							"rotationX": 149.8,
							"rotationY": 5.1,
							"rotationZ": -48.5,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.39006944444444486,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.6294444444444396,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3850694444444449,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.8500694444444448,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.2650694444444448,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashImpact",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.829588482856003,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.839588482856003,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.849588482856003,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.9250694444444445,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.39006944444444486,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.6294444444444396,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3850694444444449,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.8500694444444448,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.2650694444444448,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashContrast",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7903941175703824,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8003941175703824,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8248455274804869,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8348455274804869,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 1.9250694444444445,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.39006944444444486,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.6294444444444396,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3850694444444449,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.8500694444444448,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.2650694444444448,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashDistort",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.006
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.39006944444444486,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.6294444444444396,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3850694444444449,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.8500694444444448,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.2650694444444448,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Slash02",
							"enabled": false,
							"x": 2.17879,
							"y": 0.97991,
							"z": 1.48425,
							"rotationX": -142,
							"rotationY": -14.2,
							"rotationZ": 74.5,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4967361111111113,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.736111111111106,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5272916666666667,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.9922916666666666,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.8333333333333337,
																"dt": -0.050000000000000044
															}
														},
														{
															"time": 1.4072916666666666,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashImpact",
									"enabled": false,
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9362551495226694,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9462551495226694,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9562551495226694,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 2.031736111111111,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": true
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4967361111111113,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.736111111111106,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.4917361111111114,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.9567361111111112,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.3717361111111113,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashContrast",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.10499999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8970607842370488,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9070607842370488,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9315121941471534,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9415121941471534,
															"value": 0.016666666666666663,
															"mode": 2
														},
														{
															"time": 2.031736111111111,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4967361111111113,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.736111111111106,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.5272916666666667,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.9922916666666666,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.4072916666666666,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashDistort",
									"scaleX": 3.5,
									"scaleY": 3.5000000000000004,
									"scaleZ": 3.5000000000000004,
									"rotationX": 5.3,
									"kind": 1,
									"args": [
										24,
										300,
										0.57,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.006
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 1.5,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4967361111111113,
															"value": -2.500320053100587,
															"mode": 2
														},
														{
															"time": 1.736111111111106,
															"value": 1.9597103118896493,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06757621765136723,
																"dt": -0.5199999999999998
															},
															"nextHandle": {
																"dv": -0.04309950544713704,
																"dt": 0.3316513355058816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.4917361111111114,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021541150644896954,
																"dt": -0.499702636528235
															},
															"nextHandle": {
																"dv": 0.018518518518518517,
																"dt": 0.4288562596073172
															}
														},
														{
															"time": 0.9567361111111112,
															"value": 1.0069444444444449,
															"mode": 1,
															"prevHandle": {
																"dv": -1.0046296296296298,
																"dt": -0.06620842174634933
															},
															"nextHandle": {
																"dv": -0.9305555555555556,
																"dt": 0.0650646813536665
															}
														},
														{
															"time": 1.3717361111111113,
															"value": -0.03472222222222225,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.41025012804053784
															},
															"nextHandle": {
																"dv": -5.653469652661062e-16,
																"dt": 0.1919166956729
															}
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Chara.Knife01",
					"target": "FXAnimation.FXRoot.Chara.Male01_HouseGuard.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Chara.Knife02",
					"target": "FXAnimation.FXRoot.Chara.Male01_HouseGuard.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
				}
			]
		},
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		}
	]
}