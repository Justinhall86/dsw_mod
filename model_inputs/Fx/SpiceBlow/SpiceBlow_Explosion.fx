{
	"type": "fx",
	"duration": 16,
	"cullingRadius": 20,
	"children": [
		{
			"type": "reference",
			"name": "FX_PreviewScene",
			"source": "Fx/FX_PreviewScene.l3d",
			"x": 0.32442,
			"y": 0.35369,
			"z": -0.19,
			"scaleX": 10,
			"scaleY": 10,
			"scaleZ": 1.1
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "--------------------Spice",
					"props": {
						"tag": null
					},
					"x": -10.65329,
					"children": [
						{
							"type": "reference",
							"name": "SpiceBlow",
							"source": "Environment/Asset/SpiceBlow/SpiceBlow.prefab",
							"scaleX": 35,
							"scaleY": 35,
							"children": [
								{
									"type": "curve",
									"name": "scale",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0,
											"value": -0.011489898989898994,
											"mode": 2
										},
										{
											"time": 0.12548013463085658,
											"value": 0.9602272727272727,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "-------------Anticipation",
					"x": -0.17666666666666667,
					"y": -0.2783333333333333,
					"z": 0.3333333333333333,
					"children": [
						{
							"type": "emitter",
							"name": "Vague",
							"enabled": false,
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7019607843137254,
									0.7019607843137254,
									0.7019607843137254,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 2.5,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"useRandomColor": true,
								"instScale": 50,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"burstParticleCount": 2
							},
							"x": -0.43333333333333335,
							"y": -0.4816666666666667,
							"z": 0.16666666666666669,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.580392156862745
											]
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
																"dv": -0.4860055904056786,
																"dt": -0.14269951377868895
															},
															"nextHandle": {
																"dv": 0.7833333333333333,
																"dt": 0.22960269261712868
															}
														},
														{
															"time": 0.6396026926171298,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.1508327154525249
															},
															"nextHandle": {
																"dv": -0.07533246901372091,
																"dt": 0.6600302928514867
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.3360659864267519,
																"dt": -0.49121460031686337
															},
															"nextHandle": {
																"dv": 0.3360659864267519,
																"dt": 0.49121460031686337
															}
														},
														{
															"time": 0.9846026926171307,
															"value": 0.9465210418844278,
															"mode": 0,
															"prevHandle": {
																"dv": 0.023323400779274084,
																"dt": -0.5500000000000016
															},
															"nextHandle": {
																"dv": -0.0045714724193943,
																"dt": 0.10780202486170407
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0.5,
												"levelMax": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 1,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4196078431372549,
													0.3254901960784314,
													0.6588235294117647
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"enabled": false,
											"props": {
												"threshold": 0.01,
												"useRGB": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.6996865745995167,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.016332927048989365,
												"dt": -0.756722543350623
											},
											"nextHandle": {
												"dv": 0.013610775649163569,
												"dt": 0.6300066376259388
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Vague",
							"enabled": false,
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7019607843137254,
									0.7019607843137254,
									0.7019607843137254,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 2.1,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"useRandomColor": true,
								"instScale": 15,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -0.3
							},
							"x": -0.2733333333333333,
							"y": -0.6316666666666667,
							"z": 0.26666666666666666,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.580392156862745
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.7
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
																"dv": -0.4860055904056786,
																"dt": -0.14269951377868895
															},
															"nextHandle": {
																"dv": 0.7833333333333333,
																"dt": 0.22960269261712868
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.1508327154525249
															},
															"nextHandle": {
																"dv": -0.07533246901372091,
																"dt": 0.6600302928514867
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.002623017324159328,
															"value": 0.06569753570028236,
															"mode": 0,
															"prevHandle": {
																"dv": -0.17614383984981913,
																"dt": -0.509939605906859
															},
															"nextHandle": {
																"dv": 0.20552548477630062,
																"dt": 0.5969796752929702
															}
														},
														{
															"time": 0.9846026926171307,
															"value": 0.9465210418844278,
															"mode": 0,
															"prevHandle": {
																"dv": -0.38169018601312965,
																"dt": -0.22000000000000064
															},
															"nextHandle": {
																"dv": 0.16251680340162686,
																"dt": 0.09367203574662543
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0.5,
												"levelMax": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 1,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.24705882352941178,
													0.803921568627451,
													0.9333333333333333
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"enabled": false,
											"props": {
												"threshold": 0.01,
												"useRGB": false
											},
											"isInstance": true
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
											"value": 0.8793487721384007,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.016332927048989365,
												"dt": -0.756722543350623
											},
											"nextHandle": {
												"dv": 0.013610775649163569,
												"dt": 0.6300066376259388
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Dust Blue",
							"enabled": false,
							"props": {
								"instScale_rand": 10,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.6235294117647059,
									0.6235294117647059,
									0.6235294117647059,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"lifeTime": 8,
								"lifeTimeRand": 2,
								"emitType": "Burst",
								"burstCount": 7,
								"burstDelay": 0.2,
								"useRandomColor": true,
								"instScale": 20,
								"warmUpTime": -0.5,
								"burstParticleCount": 2,
								"alignMode": "Screen"
							},
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": -0.3333333333333333,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"color": 872415231,
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
													"textureWrap": true,
													"emissive": 4
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
												"scale": 2
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
																"dv": -1.6025399127347053,
																"dt": -0.13736056394868915
															},
															"nextHandle": {
																"dv": 0.23333333333333334,
																"dt": 0.020000000000000004
															}
														},
														{
															"time": 0.09999999999999999,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.02076439710376039,
																"dt": -0.03444447048976718
															},
															"nextHandle": {
																"dv": -0.2833333333333333,
																"dt": 0.4699999999999999
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.3498306274414062,
															"mode": 0,
															"prevHandle": {
																"dv": 0.34528353621197455,
																"dt": -0.4602148641995827
															},
															"nextHandle": {
																"dv": -0.34528353621197455,
																"dt": 0.4602148641995827
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483109975988127,
																"dt": -0.4835372686313232
															},
															"nextHandle": {
																"dv": -0.5,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0.5,
												"levelMax": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.5,
												"color": [
													0.3333333333333333,
													0.5098039215686274,
													0.7137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"enabled": false,
											"props": {
												"threshold": 0.01,
												"useRGB": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.4260541118472685,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 1.0883207428747863,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort",
							"enabled": false,
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 1.5,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"instScale": 30,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"speedFactor": 0.5
							},
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": 0.1166666666666667,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 1,
									"args": [
										15,
										360,
										0,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Add",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
												"intensity": 0.1
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.004242424242424214,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03333333333333333,
																"dt": -0.51
															},
															"nextHandle": {
																"dv": -0.02178544542538359,
																"dt": 0.33331731500836026
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 0,
												"width": 0.92,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3383333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
															}
														}
													]
												}
											],
											"isInstance": true
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.6101554739171128,
												"dt": -0.33018814592265844
											},
											"nextHandle": {
												"dv": 0.9136438538946278,
												"dt": 0.49018439845683004
											}
										},
										{
											"time": 1,
											"value": 0.8381552269664314,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02797092125097078,
												"dt": -0.385
											},
											"nextHandle": {
												"dv": 0.02418463748949856,
												"dt": 0.33288447491281076
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort_Revert",
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"instScale": 25,
								"emitShape": "Cylinder",
								"emitSurface": true
							},
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": 0.1166666666666667,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 1,
									"args": [
										15,
										360,
										0,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Add",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
												"intensity": 0.05
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.01235353535353545,
															"mode": 2
														},
														{
															"time": 0.03884502701146505,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06712041131603325,
																"dt": -0.02527739166268755
															},
															"nextHandle": {
																"dv": -0.5310707070707071,
																"dt": 0.20075766560566366
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03333333333333333,
																"dt": -0.51
															},
															"nextHandle": {
																"dv": -0.02178544542538359,
																"dt": 0.33331731500836026
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.69,
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.15381774339106308,
																"dt": -0.4993438317382942
															},
															"nextHandle": {
																"dv": 0.06666666666666665,
																"dt": 0.21642229334959104
															}
														},
														{
															"time": 0.5096026926171294,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 0.12399640608263467,
																"dt": -0.12253762483460386
															},
															"nextHandle": {
																"dv": -0.2833333333333333,
																"dt": 0.2800000000000007
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.6166666666666667,
																"dt": -0.2508459076360311
															},
															"nextHandle": {
																"dv": -0.8238379005043205,
																"dt": 0.33361164032829815
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0027746447865332168,
															"value": -0.06666666666666667,
															"mode": 2
														},
														{
															"time": 0.1359575945401277,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.022197158292265744
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.022197158292265744
															}
														}
													]
												}
											],
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0027746447865332202,
											"value": 0.9606914938954996,
											"mode": 0,
											"prevHandle": {
												"dv": 1.3298698452638637e-16,
												"dt": -0.341515025625114
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3422253552134668
											}
										},
										{
											"time": 1,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": 0.2924886640373511,
												"dt": -0.29500000000000004
											},
											"nextHandle": {
												"dv": -0.2924886640373511,
												"dt": 0.29500000000000004
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SemiSphere",
							"source": "Fx/Meshes_Common/SemiSphere.fbx",
							"enabled": false,
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": -0.3333333333333333,
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
											"colorMask": 255,
											"depthTest": "Less"
										}
									},
									"diffuseMap": "Fx/Gradients/circGrad05.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceBlow_Albedo.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.3607843137254902,
											0.24313725490196078,
											0.580392156862745
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
										"progress": 0.53,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8146026926171301,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4496026926171317,
													"value": 0.6499999999999992,
													"mode": 2
												},
												{
													"time": 2.22,
													"value": 0.8833333333333333,
													"mode": 2
												},
												{
													"time": 2.7846026926171352,
													"value": 0.2594444444444444,
													"mode": 2
												},
												{
													"time": 3.9941285521346694,
													"value": 0.0011111111111110628,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0
										},
										{
											"time": 2.3346026926171337,
											"value": 0.16666666666666669,
											"mode": 2
										},
										{
											"time": 2.6396026926171348,
											"value": 5.551115123125783e-17,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04623627006965758,
												"dt": -0.0731250000000001
											},
											"nextHandle": {
												"dv": 0.09998413501702996,
												"dt": 0.15812996727688813
											}
										},
										{
											"time": 6,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "object",
					"name": "--------------------------Pic",
					"scaleX": 1.5,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "emitter",
							"name": "Pic_Violet",
							"props": {
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4,
								"lifeTime": 1.5
							},
							"z": -0.81864,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes_2.fbx",
									"scaleX": 2.42,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationY": 90,
									"rotationZ": 90,
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
													"depthTest": "Less",
													"alphaKill": false
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_03.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.7,
												"uvScaleX": 3,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0.5,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.06,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.007044139776202722,
																"dt": -0.022244651924850683
															},
															"nextHandle": {
																"dv": -0.09499999999999997,
																"dt": 0.3
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26,
																"dt": -0.21000000000000008
															},
															"nextHandle": {
																"dv": -0.24375490313049952,
																"dt": 0.19687896022078794
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 0.52,
												"useU": false,
												"progress": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9573893374486504,
																"dt": -0.2306763683209948
															},
															"nextHandle": {
																"dv": 0.8333333333333334,
																"dt": 0.065
															}
														},
														{
															"time": 0.085,
															"value": 0.6666666666666666,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.30166666666666664
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.30166666666666664
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 1
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
													0.5764705882352941,
													0.3137254901960784,
													0.44705882352941173
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.2,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pic_Add_Pink",
							"props": {
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4
							},
							"z": -0.81864,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes_2.fbx",
									"scaleX": 2,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationY": 90,
									"rotationZ": 90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "Less",
													"alphaKill": false,
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_03.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.06,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.007044139776202722,
																"dt": -0.022244651924850683
															},
															"nextHandle": {
																"dv": -0.09499999999999997,
																"dt": 0.3
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3133333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.1966615995472233,
																"dt": -0.4965705388567374
															},
															"nextHandle": {
																"dv": -0.19999999999999996,
																"dt": 0.505
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVSweep",
											"source": "shaders/UVSweep.hx",
											"props": {
												"saturation": 1,
												"width": 0.52,
												"useU": true,
												"progress": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8373866866139594,
																"dt": -0.47381699800778115
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.22399271152389716
															}
														},
														{
															"time": 0.9363737614860296,
															"value": 1,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 1
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
													0.47058823529411764,
													0.36470588235294116,
													0.6039215686274509
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.2,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "------------------SandEffect",
					"z": 0.6666666666666666,
					"children": [
						{
							"type": "emitter",
							"name": "Decal_Sand",
							"props": {
								"lifeTime": 15,
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 50,
								"instRotation_rand": [
									0,
									0,
									180
								]
							},
							"x": 0.05666666666666667,
							"y": -0.023333333333333334,
							"z": 0.5,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SandDecal_02.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "fakeLight",
											"props": {},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 1,
											"dirIntensity": 0.43,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.75
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.51,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.005246447865332172,
											"value": -0.03333333333333333,
											"mode": 2
										},
										{
											"time": 0.013938613842716968,
											"value": 1.0333333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03508214928844406
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03508214928844406
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Close_SandJet_R_VIOLET",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.592156862745098,
									0.24705882352941178,
									0.3529411764705882,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 6,
								"lifeTime": 3,
								"emitRad1": 0.73,
								"randomColor2": [
									0.4,
									0.24705882352941178,
									0.592156862745098,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3.8,
									1
								],
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 150,
								"instRotation": [
									0,
									0,
									45
								],
								"useRandomColor": true
							},
							"z": 0.1233333333333334,
							"scaleX": 10.000000000000002,
							"scaleY": 10.000000000000002,
							"scaleZ": 0.2,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"drawOrder": "-80"
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.6
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Close_SandJet_L_VIOLET",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.592156862745098,
									0.24705882352941178,
									0.3529411764705882,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 6,
								"lifeTime": 3,
								"emitRad1": 0.73,
								"randomColor2": [
									0.4,
									0.24705882352941178,
									0.592156862745098,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3.8,
									1
								],
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 150,
								"instRotation": [
									0,
									0,
									-45
								],
								"useRandomColor": true
							},
							"z": 0.1233333333333334,
							"scaleX": 10.000000000000002,
							"scaleY": 10.000000000000002,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.2,
											"envBlend": 0.6
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Close_SandJet_R",
							"props": {
								"instScale_rand": 2,
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
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 7,
								"lifeTime": 4,
								"emitRad1": 0.73,
								"randomColor2": [
									0.8274509803921568,
									0.6196078431372549,
									0.5098039215686274,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitAngle": 139.09,
								"instRotation": [
									0,
									0,
									45
								],
								"seedGroup": 18,
								"useRandomColor": true
							},
							"x": 1.06,
							"z": 0.79,
							"scaleX": 27,
							"scaleY": 27,
							"scaleZ": 0.2,
							"rotationZ": 92.8,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												1,
												1,
												0.9882352941176471
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0,
												"color": [
													0.5019607843137255,
													0.08627450980392157,
													0.4235294117647059
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.5
											},
											"isInstance": true
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Close_SandJet_L",
							"props": {
								"instScale_rand": 2,
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
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 7,
								"lifeTime": 4,
								"emitRad1": 0.73,
								"randomColor2": [
									0.8274509803921568,
									0.6196078431372549,
									0.5098039215686274,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": 0.5,
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitAngle": 136.36,
								"instRotation": [
									0,
									0,
									-45
								],
								"seedGroup": 18,
								"useRandomColor": true
							},
							"x": 1.06,
							"z": 0.79,
							"scaleX": 27,
							"scaleY": 27,
							"scaleZ": 0.2,
							"rotationZ": -87.2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.15,
															"value": 1,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0,
												"color": [
													0.5019607843137255,
													0.08627450980392157,
													0.4235294117647059
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.5
											},
											"isInstance": true
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "-----------------LateEffects",
					"x": -0.35000000000000003,
					"z": 13.571428571428571,
					"children": [
						{
							"type": "emitter",
							"name": "Cloud_Sand_Violet",
							"props": {
								"instScale_rand": 5,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									0.5882352941176471,
									0.2588235294117647,
									0.5764705882352941,
									1
								],
								"randomColor2": [
									0.4,
									0.24705882352941178,
									0.592156862745098,
									1
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 7,
								"emitType": "Burst",
								"burstParticleCount": 10,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 10,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 2,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0.05
								],
								"instAcceleration": [
									0,
									0,
									-0.1
								],
								"alignMode": "Screen",
								"useRandomColor": true
							},
							"z": -6.15373,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
																"dv": -2.106716002441871,
																"dt": -0.6821153640926553
															},
															"nextHandle": {
																"dv": 0.5801666666666667,
																"dt": 0.1877523574176082
															}
														},
														{
															"time": 0.45720523661786744,
															"value": 0.934712962962963,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": false,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.8,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.9,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparks",
							"props": {
								"instScale_rand": 5,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									0.592156862745098,
									0.24705882352941178,
									0.3529411764705882,
									1
								],
								"randomColor2": [
									0.4,
									0.24705882352941178,
									0.592156862745098,
									1
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 10,
								"emitType": "Burst",
								"burstParticleCount": 10,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 10,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 2,
								"instStretch_rand": [
									0,
									1,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0.05
								],
								"instAcceleration": [
									0,
									0,
									-0.1
								],
								"alignMode": "Screen",
								"warmUpTime": 0.2,
								"speedFactor": 2,
								"instWorldSpeed": [
									0,
									0,
									30
								],
								"instWorldSpeed_rand": [
									0,
									0,
									10
								],
								"instStretch": [
									0.5,
									2,
									1
								]
							},
							"y": 0.75571,
							"z": -19.12123,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"textureWrap": true,
													"emissive": 20,
													"drawOrder": "120"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
																"dv": -2.106716002441871,
																"dt": -0.6821153640926553
															},
															"nextHandle": {
																"dv": 0.5801666666666667,
																"dt": 0.1877523574176082
															}
														},
														{
															"time": 0.45720523661786744,
															"value": 0.934712962962963,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": false,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.1,
												"uvScaleX": 0.08,
												"uvScaleY": 0.08,
												"texture": "Fx/noise/NoisePurple_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.53,
												"color": [
													0.3568627450980392,
													0.24705882352941178,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041666666666666664
											}
										},
										{
											"time": 0.05,
											"value": 0.05,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3183333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3183333333333333
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "-----------------Shockwave",
					"z": 1,
					"children": [
						{
							"type": "emitter",
							"name": "ShockWave",
							"props": {
								"emitType": "Burst",
								"instScale": 60
							},
							"z": 1.27,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "-80"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
												"onDecal": false
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.9,
																"dt": -0.3500000000000001
															},
															"nextHandle": {
																"dv": -0.6785886478288514,
																"dt": 0.26389558526677537
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.5
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
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 5,
												"uvScaleY": 5,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.54458333757373,
												"dt": -0.18132065267169872
											},
											"nextHandle": {
												"dv": 1.15,
												"dt": 0.135
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort_Chockwave",
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.8
							},
							"z": 0.97,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/DiskFlat.fbx",
									"scaleX": 50,
									"scaleY": 50,
									"scaleZ": 50,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
												"intensity": 0.02
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8043636363636364,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5969588995728569,
																"dt": -0.2623791435549754
															},
															"nextHandle": {
																"dv": -0.5969588995728569,
																"dt": 0.2623791435549754
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08425454545454536,
																"dt": -0.2350000000000001
															},
															"nextHandle": {
																"dv": -0.08425454545454536,
																"dt": 0.2350000000000001
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5350976805491343,
															"value": 0.9422222222222223,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03695353771889259
															},
															"nextHandle": {
																"dv": -6.922428196740585e-16,
																"dt": 0.24478506621704163
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
															}
														}
													]
												}
											],
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.0402048299726524,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9239350146379692,
												"dt": -0.3456633226416698
											},
											"nextHandle": {
												"dv": 0.12028199966650588,
												"dt": 0.045000000000000005
											}
										},
										{
											"time": 1,
											"value": 1.0158254939343108,
											"mode": 0,
											"prevHandle": {
												"dv": -0.026729333259223442,
												"dt": -0.865
											},
											"nextHandle": {
												"dv": 0.0103433736750329,
												"dt": 0.33472657705803693
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "event",
					"name": "boom",
					"time": 0.1
				}
			]
		}
	]
}