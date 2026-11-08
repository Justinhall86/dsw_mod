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
					"type": "model",
					"name": "Airfield",
					"source": "Structure/Buildings/Airfield/Airfield.fbx",
					"editorOnly": true,
					"rotationZ": -90
				},
				{
					"type": "object",
					"name": "DustCloud",
					"z": -0.18,
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"children": [
						{
							"type": "emitter",
							"name": "Dust_L",
							"props": {
								"instScale_rand": 2,
								"animationSpeed": 0.01,
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
									360
								],
								"lifeTimeRand": 3,
								"emitSurface": true,
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"alignMode": "Screen",
								"lifeTime": 7,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 8,
								"useRandomColor": true,
								"randomColor2": [
									0.7215686274509804,
									0.7215686274509804,
									0.7215686274509804,
									1
								],
								"emitRate": 3,
								"maxCount": 50,
								"emitShape": "Cylinder",
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Normal",
								"emitRad2": 0.89,
								"instSpeed": [
									5,
									0,
									0
								],
								"seedGroup": 2,
								"instAcceleration": [
									0,
									0,
									1
								],
								"instAcceleration_rand": [
									0,
									0,
									0.25
								],
								"speedFactor": 3,
								"emitAngle": 180
							},
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 0.1,
							"rotationZ": -90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.1,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"culling": "None",
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
												0.6509803921568628,
												0.6509803921568628,
												0.6509803921568628,
												0.7294117647058823
											]
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
												"alpha": 0.7
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
																"dv": -3.0422716342761236,
																"dt": -0.34988109631104786
															},
															"nextHandle": {
																"dv": 0.23722222222222222,
																"dt": 0.027998637832460843
															}
														},
														{
															"time": 0.06320987654320986,
															"value": 0.9889393939393939,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323237,
																"dt": -0.09131785224377817
															},
															"nextHandle": {
																"dv": 0.009064468553733966,
																"dt": 0.050212252590299336
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323293,
																"dt": -0.3893833383964368
															},
															"nextHandle": {
																"dv": 0.009046803712101453,
																"dt": 0.21392254723381063
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
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
												"range": 1.2,
												"power": 1.5
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
													0.7333333333333333,
													0.7333333333333333,
													0.7333333333333333
												]
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.45,
											"topSpan": 0.35,
											"dirIntensity": 0.22,
											"dirSpan": 0.76,
											"sandBlend": 0.35,
											"envBlend": 0.5
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
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01666666666666672,
												"dt": -0.6387434616680792
											},
											"nextHandle": {
												"dv": 0.015718886330311054,
												"dt": 0.6028325475085824
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0027065579383954708,
												"dt": -0.6592770655829049
											},
											"nextHandle": {
												"dv": -0.00247773272334058,
												"dt": 0.6028416630865135
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.48594403673302045,
												"dt": 2.474033937671423e-17
											},
											"nextHandle": {
												"dv": -0.2940795898437507,
												"dt": 0.000655636259820791
											}
										},
										{
											"time": 1,
											"value": 0.75,
											"mode": 0,
											"prevHandle": {
												"dv": -0.005517578125000755,
												"dt": -0.9549500471556477
											},
											"nextHandle": {
												"dv": 0.002072042364634285,
												"dt": 0.3333635710522648
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 221.9013970026372,
												"dt": -3.3553253116370656
											},
											"nextHandle": {
												"dv": -14.166666666666666,
												"dt": 0.21421124828532234
											}
										},
										{
											"time": 1,
											"value": -15,
											"mode": 0,
											"prevHandle": {
												"dv": -1.413276791572569,
												"dt": -0.4062824095242934
											},
											"nextHandle": {
												"dv": 1.413276791572569,
												"dt": 0.4062824095242934
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Dust_R",
							"props": {
								"instScale_rand": 2,
								"animationSpeed": 0.01,
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
									360
								],
								"lifeTimeRand": 3,
								"emitSurface": true,
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"alignMode": "Screen",
								"lifeTime": 7,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 8,
								"useRandomColor": true,
								"randomColor2": [
									0.7215686274509804,
									0.7215686274509804,
									0.7215686274509804,
									1
								],
								"emitRate": 3,
								"maxCount": 50,
								"emitShape": "Cylinder",
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Normal",
								"emitRad2": 0.89,
								"instSpeed": [
									5,
									0,
									0
								],
								"seedGroup": 1,
								"instAcceleration": [
									0,
									0,
									1
								],
								"instAcceleration_rand": [
									0,
									0,
									0.25
								],
								"speedFactor": 3,
								"emitAngle": 180
							},
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 0.1,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.1,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"culling": "None",
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
												0.6509803921568628,
												0.6509803921568628,
												0.6509803921568628,
												0.7294117647058823
											]
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
												"alpha": 0.7
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
																"dv": -3.0422716342761236,
																"dt": -0.34988109631104786
															},
															"nextHandle": {
																"dv": 0.23722222222222222,
																"dt": 0.027998637832460843
															}
														},
														{
															"time": 0.06320987654320986,
															"value": 0.9889393939393939,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323237,
																"dt": -0.09131785224377817
															},
															"nextHandle": {
																"dv": 0.009064468553733966,
																"dt": 0.050212252590299336
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323293,
																"dt": -0.3893833383964368
															},
															"nextHandle": {
																"dv": 0.009046803712101453,
																"dt": 0.21392254723381063
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
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
												"range": 1.2,
												"power": 1.5
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
													0.7333333333333333,
													0.7333333333333333,
													0.7333333333333333
												]
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.45,
											"topSpan": 0.35,
											"dirIntensity": 0.22,
											"dirSpan": 0.76,
											"sandBlend": 0.35,
											"envBlend": 0.5
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
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01666666666666672,
												"dt": -0.6387434616680792
											},
											"nextHandle": {
												"dv": 0.015718886330311054,
												"dt": 0.6028325475085824
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.48594403673302045,
												"dt": 2.474033937671423e-17
											},
											"nextHandle": {
												"dv": -0.2940795898437507,
												"dt": 0.000655636259820791
											}
										},
										{
											"time": 1,
											"value": 0.75,
											"mode": 0,
											"prevHandle": {
												"dv": -0.005517578125000755,
												"dt": -0.9549500471556477
											},
											"nextHandle": {
												"dv": 0.002072042364634285,
												"dt": 0.3333635710522648
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -174.4528345512133,
												"dt": -3.5437653355622234
											},
											"nextHandle": {
												"dv": 16.25,
												"dt": 0.3300960219478738
											}
										},
										{
											"time": 1,
											"value": 15,
											"mode": 0,
											"prevHandle": {
												"dv": -1.413276791572569,
												"dt": -0.4062824095242934
											},
											"nextHandle": {
												"dv": 1.413276791572569,
												"dt": 0.4062824095242934
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0027065579383954708,
												"dt": -0.6592770655829049
											},
											"nextHandle": {
												"dv": -0.00247773272334058,
												"dt": 0.6028416630865135
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
}