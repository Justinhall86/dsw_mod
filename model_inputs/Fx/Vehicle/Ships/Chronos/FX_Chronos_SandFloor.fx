{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 3,
			"scaleY": 3,
			"scaleZ": 3,
			"children": [
				{
					"type": "model",
					"name": "Chronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"editorOnly": true,
					"z": 3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Idle_Airfield.fbx"
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"enabled": false,
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.36,
								"scale": 0.17,
								"power": 0.25,
								"color": [
									0.8784313725490196,
									1,
									0.8117647058823529
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "FLOORTRAIL",
					"enabled": false,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "emitter",
							"name": "SandFloor2",
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
								"lifeTimeRand": 0.2,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2.5,
								"lifeTime": 2.25,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									0.1,
									0.25,
									0
								],
								"emitRate": 45,
								"maxCount": 90,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									0.6,
									0.6,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"speedFactor": 0.7,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instStretch": [
									1,
									0.8,
									1
								],
								"instAcceleration_rand": [
									1.5,
									0,
									0
								],
								"emitAngle": 360
							},
							"scaleX": 5,
							"scaleY": 7,
							"scaleZ": 0.06,
							"rotationZ": 90,
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
											"isInstance": true,
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
											]
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
												"useScale": false,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.41,
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
											"isInstance": true,
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
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
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
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.1562467376557881,
												"dt": -0.4434037260494899
											},
											"nextHandle": {
												"dv": 0.9296473571905786,
												"dt": 0.35500000000000004
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 2
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
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05066502888997454,
												"dt": -0.72
											},
											"nextHandle": {
												"dv": 0.05066502888997454,
												"dt": 0.72
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SandFloor2",
							"enabled": false,
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
								"lifeTimeRand": 0.2,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"lifeTime": 2.25,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									0.1,
									0.25,
									0
								],
								"emitRate": 20,
								"maxCount": 45,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									0.5,
									0.5,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"speedFactor": 0.7,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instStretch": [
									1,
									0.8,
									1
								],
								"instAcceleration_rand": [
									1.5,
									0,
									0
								],
								"emitAngle": 110
							},
							"scaleX": 4,
							"scaleY": 8,
							"scaleZ": 0.06,
							"rotationZ": 90,
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
											"isInstance": true,
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
											]
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
												"useScale": false,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.41,
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
											"isInstance": true,
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
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.5,
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
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.1562467376557881,
												"dt": -0.4434037260494899
											},
											"nextHandle": {
												"dv": 0.9296473571905786,
												"dt": 0.35500000000000004
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 2
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
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05066502888997454,
												"dt": -0.72
											},
											"nextHandle": {
												"dv": 0.05066502888997454,
												"dt": 0.72
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SandFloor2",
							"enabled": false,
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
								"lifeTimeRand": 0.2,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 2,
								"lifeTime": 2.25,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									0.1,
									-0.25,
									0
								],
								"emitRate": 20,
								"maxCount": 45,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									0.5,
									-0.5,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"speedFactor": 0.7,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instStretch": [
									1,
									0.8,
									1
								],
								"seedGroup": 20,
								"instAcceleration_rand": [
									1.5,
									0,
									0
								],
								"emitAngle": 110
							},
							"scaleX": 5,
							"scaleY": 10,
							"scaleZ": 0.07,
							"rotationZ": -90,
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
											"isInstance": true,
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
											]
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
												"useScale": false,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.41,
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
											"isInstance": true,
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
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.6,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.5,
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
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.1562467376557881,
												"dt": -0.4434037260494899
											},
											"nextHandle": {
												"dv": 0.9296473571905786,
												"dt": 0.35500000000000004
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "distort",
							"z": 1,
							"scaleX": 10,
							"scaleY": 8,
							"scaleZ": 5,
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
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.01
									}
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
										"shiftSpeedX": -0.1,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/circGrad01.png"
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Atterrissage",
					"x": 0.11431166666666667,
					"y": 0.7666933333333332,
					"z": 0.4,
					"scaleX": 0.18,
					"scaleY": 0.18,
					"scaleZ": 0.18,
					"children": [
						{
							"type": "emitter",
							"name": "HeatWave_Distort",
							"props": {
								"lifeTime": 6,
								"lifeTimeRand": 2,
								"emitRate": 2,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									0.8313725490196078
								],
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instScale": 250,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 20
							},
							"x": -0.11431166666666667,
							"y": -0.7666933333333331,
							"z": 1.1559066666666666,
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
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
															"mode": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0058489084243771305,
																"dt": -0.06672153635116596
															},
															"nextHandle": {
																"dv": 0.0058489084243771305,
																"dt": 0.06672153635116596
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": false,
												"envBlend": 0.2,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/sand-normal.png",
												"intensity": 0.01
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 4.798457903166657,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.929159096086367,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
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
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9944446984687934,
												"dt": -0.48890120703870477
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.3425225781956737
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
							"name": "Sand_Left",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 30,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"emitRate": 12,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									0.75,
									0.75,
									0
								],
								"instSpeed": [
									6,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 141.82,
								"useRandomColor": true
							},
							"z": -0.57795,
							"scaleX": 57.269999999999996,
							"scaleY": 80,
							"scaleZ": 0.1,
							"rotationZ": -90,
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
												"scale": 0.75
											},
											"isInstance": true,
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
											]
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
												"progress": 0.7,
												"saturation": 0.2,
												"width": 1,
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
											"isInstance": true,
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
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.65,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0548504453716856,
												"dt": -0.5364207458496086
											},
											"nextHandle": {
												"dv": 0.03370328877818467,
												"dt": 0.33218191941495984
											}
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003867101121040606,
												"dt": -0.3716559620166764
											},
											"nextHandle": {
												"dv": 0.003867101121040606,
												"dt": 0.3716559620166764
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Right",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9686274509803922,
									0.9568627450980391,
									0.9490196078431372,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 30,
								"lifeTime": 3,
								"emitRad1": 0.36,
								"emitRad2": 0.58,
								"randomColor2": [
									0.807843137254902,
									0.788235294117647,
									0.7803921568627451,
									1
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"emitRate": 12,
								"maxCount": 70,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									0.75,
									0.75,
									0
								],
								"instSpeed": [
									6,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"emitAngle": 141.82,
								"useRandomColor": true
							},
							"z": -0.57795,
							"scaleX": 57.27000000000001,
							"scaleY": 80,
							"scaleZ": 0.1,
							"rotationZ": 90,
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
												"scale": 0.75
											},
											"isInstance": true,
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
											]
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
												"progress": 0.7,
												"saturation": 0.2,
												"width": 1,
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
											"isInstance": true,
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
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.65,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 62.88,
												"power": 25.76
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
											"value": 0.0035385342353464466,
											"mode": 0,
											"prevHandle": {
												"dv": -0.827144588185986,
												"dt": -0.512990755987711
											},
											"nextHandle": {
												"dv": 0.537534364642519,
												"dt": 0.3374369812011724
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003867101121040606,
												"dt": -0.3716559620166764
											},
											"nextHandle": {
												"dv": 0.003867101121040606,
												"dt": 0.3716559620166764
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": -0.01394734457883267,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.0602391808606801,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5333333333333333,
												"dt": -0.4725329589843752
											},
											"nextHandle": {
												"dv": 0.016666666666666607,
												"dt": 0.31836303710937575
											}
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0
										},
										{
											"time": 3.3725649252273637,
											"value": 0.9833333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.21809168368578025
											},
											"nextHandle": {
												"dv": -0.049836898730717664,
												"dt": 0.6521407892315909
											}
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.993478030671133,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
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
								"range": 2,
								"power": 0.8
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}