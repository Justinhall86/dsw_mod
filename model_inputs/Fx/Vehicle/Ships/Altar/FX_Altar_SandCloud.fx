{
	"type": "fx",
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Altar",
					"source": "Vehicle/Fremen/Altar/Altar.fbx",
					"editorOnly": true,
					"z": 10,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent"
						},
						{
							"type": "object",
							"name": "Fabric",
							"scaleX": 0.28,
							"scaleY": 0.28,
							"scaleZ": 0.28,
							"children": [
								{
									"type": "model",
									"name": "Altar_Fabric",
									"source": "Vehicle/Fremen/Altar/Altar_Balloon.fbx",
									"scaleX": 3.6,
									"scaleY": 3.6,
									"scaleZ": 3.6
								},
								{
									"type": "model",
									"name": "Altar_FabricStrips",
									"source": "Vehicle/Fremen/Altar/Altar_FabricStrips.fbx",
									"scaleX": 3.6,
									"scaleY": 3.6,
									"scaleZ": 3.6
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "CorialisSandStorm",
					"children": [
						{
							"type": "object",
							"name": "----------------- Directional_Efect",
							"enabled": false,
							"x": -5.86741,
							"z": -2.81247,
							"children": [
								{
									"type": "emitter",
									"name": "Smoke_Big_1",
									"enabled": false,
									"props": {
										"lifeTime": 3,
										"alignMode": "Screen",
										"instScale_rand": 10,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.1,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.8745098039215686,
											0.8392156862745098,
											0.7725490196078432,
											0.9882352941176471
										],
										"emitRate": 7,
										"lifeTimeRand": 0.5,
										"instSpeed": [
											0.03,
											0,
											0.04
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"useRandomColor": true,
										"enableSort": false,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
										"emitOrientation": "Normal",
										"emitShape": "Cylinder",
										"animationLoop": false,
										"speedFactor": 0.3,
										"instScale": 25,
										"seedGroup": 2,
										"emitAngle": 360,
										"emitSurface": true
									},
									"z": -2.11214,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 0.06,
									"rotationY": 13.9,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None",
															"drawOrder": "-90"
														}
													},
													"color": [
														1,
														0.8509803921568627,
														0.7098039215686275,
														1
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1427083333333335
																	}
																},
																{
																	"time": 0.4281250000000005,
																	"value": 1,
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
															0.8549019607843137,
															0.7607843137254902,
															0.7294117647058823
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
														"progress": 0.45,
														"saturation": 0,
														"width": 0.9,
														"uvScaleX": 3,
														"uvScaleY": 3,
														"texture": "Fx/noise/NoisyWave_01.png",
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
																	"value": 5.551115123125783e-17,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.028256042300289,
																		"dt": -0.30211920317252183
																	},
																	"nextHandle": {
																		"dv": 0.44999999999999996,
																		"dt": 0.034375000000000086
																	}
																},
																{
																	"time": 0.12437500000000017,
																	"value": 0.9749999999999999,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.04145833333333339
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.29187499999999994
																	}
																},
																{
																	"time": 1,
																	"value": 5.551115123125783e-17,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topIntensity": 1,
													"dirIntensity": 0.3,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
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
														"dv": -1.254788989743307,
														"dt": -0.37509243716696183
													},
													"nextHandle": {
														"dv": 1.053051484551041,
														"dt": 0.3183084042568539
													}
												},
												{
													"time": 1,
													"value": 2,
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
							"name": "----------------------Details_Effect",
							"x": 0.003333333333333333,
							"y": 0.16333333333333333,
							"z": -5.07,
							"children": [
								{
									"type": "emitter",
									"name": "OrbitalProjectile",
									"enabled": false,
									"props": {
										"enableSort": false,
										"emitShape": "Cylinder",
										"emitRad2": 0.99,
										"lifeTime": 2,
										"emitRate": 8,
										"emitOrientation": "Speed",
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
											0.7411764705882353
										],
										"instStretch_rand": [
											1,
											0,
											0
										],
										"instOrbitSpeed_rand": [
											4,
											4,
											4
										],
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instRotation": [
											90,
											0,
											0
										],
										"instScale_rand": 0.7,
										"instScale": 3,
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"emitRad1": 0.97,
										"useRandomColor": true,
										"emitSurface": true,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_02.png",
										"warmUpTime": 1
									},
									"x": 15.8747,
									"z": 15.52122,
									"scaleX": 60,
									"scaleY": 60,
									"scaleZ": 15,
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
															"mode": "AfterTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"drawOrder": "120"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"color": [
														0.7411764705882353,
														0.7411764705882353,
														0.7411764705882353,
														1
													]
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
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SandDecal_01.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.005703124999999969,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.45625000000000043,
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
													]
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9529411764705882,
															0.8784313725490196,
															0.7411764705882353
														]
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topSpan": 0,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "OrbitalProjectile",
									"props": {
										"enableSort": false,
										"emitShape": "Cylinder",
										"emitRad2": 0.99,
										"lifeTime": 2,
										"emitOrientation": "Speed",
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
											0.7411764705882353
										],
										"instStretch_rand": [
											1,
											0,
											0
										],
										"instOrbitSpeed_rand": [
											3,
											3,
											3
										],
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instRotation": [
											90,
											0,
											0
										],
										"instScale_rand": 0.7,
										"instScale": 4,
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"emitRad1": 0.97,
										"useRandomColor": true,
										"emitSurface": true,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_02.png",
										"warmUpTime": 1,
										"emitRate": 6,
										"speedFactor": 2
									},
									"x": 19.50594,
									"z": 15.52122,
									"scaleX": 30,
									"scaleY": 45,
									"scaleZ": 15,
									"rotationY": 90,
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
															"mode": "AfterTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"drawOrder": "120"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"color": [
														0.7411764705882353,
														0.7411764705882353,
														0.7411764705882353,
														1
													]
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SandDecal_01.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.005703124999999969,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.45625000000000043,
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
													]
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7529411764705882,
															0.5490196078431373,
															0.4549019607843137
														]
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
															1,
															1,
															1
														]
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topSpan": 0,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
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
													}
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "BigFlash_Ground",
									"enabled": false,
									"z": 7.41382,
									"scaleX": 150,
									"scaleY": 150,
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
													"mode": "DecalPass",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"diffuseMap": "Fx/Gradients/circGrad3.jpg",
											"mainPassName": "decal"
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "----------------------Smoke_Effect",
							"z": 19.2657,
							"children": [
								{
									"type": "emitter",
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 7,
										"alignMode": "Screen",
										"instScale_rand": 10,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.2,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.6705882352941176,
											0.611764705882353,
											0.7176470588235294,
											0.9882352941176471
										],
										"emitRate": 3,
										"lifeTimeRand": 0.5,
										"instSpeed": [
											0.03,
											0,
											0.04
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"useRandomColor": true,
										"enableSort": false,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_03_2.png",
										"emitOrientation": "Normal",
										"animationLoop": false,
										"speedFactor": 0.6,
										"instScale": 50,
										"seedGroup": 2,
										"maxCount": 25
									},
									"y": 2.68039,
									"z": -1.23448,
									"scaleX": 25,
									"scaleY": 30,
									"scaleZ": 20,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None"
														}
													},
													"color": [
														1,
														0.7764705882352941,
														0.5647058823529412,
														1
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.74,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
													]
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.803921568627451,
															0.6549019607843137,
															0.580392156862745
														]
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
															0.9490196078431372,
															0.8431372549019608,
															0.792156862745098
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2.5,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.3,
													"dirIntensity": 0.2,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
												},
												{
													"type": "shader",
													"name": "lightning",
													"source": "shaders/ColorAdd.hx",
													"props": {
														"amount": 0,
														"color": [
															0.49019607843137253,
															0.7254901960784313,
															1
														],
														"tag": "Used by code"
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
													"time": 0.019999999999999997,
													"value": 0.7850000000000001,
													"mode": 2
												},
												{
													"time": 0.245,
													"value": 1.0908097451790637,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061403662613847505,
														"dt": -0.08343956833586955
													},
													"nextHandle": {
														"dv": 0.32246091597796145,
														"dt": 0.4385714285714285
													}
												},
												{
													"time": 1,
													"value": 1.5405299586776862,
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
							"name": "Floor",
							"enabled": false,
							"z": -1.82026,
							"children": [
								{
									"type": "emitter",
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 7,
										"alignMode": "Screen",
										"instScale_rand": 10,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"simulationSpace": "World",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.2,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.6705882352941176,
											0.611764705882353,
											0.7176470588235294,
											0.9882352941176471
										],
										"emitRate": 3,
										"lifeTimeRand": 0.5,
										"instSpeed": [
											0.03,
											0,
											0.04
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"useRandomColor": true,
										"enableSort": false,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_03_2.png",
										"emitOrientation": "Normal",
										"animationLoop": false,
										"speedFactor": 0.6,
										"instScale": 50,
										"seedGroup": 2,
										"maxCount": 25
									},
									"y": 2.68039,
									"z": -1.23448,
									"scaleX": 25,
									"scaleY": 30,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None"
														}
													},
													"color": [
														1,
														0.7764705882352941,
														0.5647058823529412,
														1
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.74,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
													]
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.803921568627451,
															0.6549019607843137,
															0.580392156862745
														]
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
															0.9490196078431372,
															0.8431372549019608,
															0.792156862745098
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2.5,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.3,
													"dirIntensity": 0.2,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
												},
												{
													"type": "shader",
													"name": "lightning",
													"source": "shaders/ColorAdd.hx",
													"props": {
														"amount": 0,
														"color": [
															0.49019607843137253,
															0.7254901960784313,
															1
														],
														"tag": "Used by code"
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
													"time": 0.019999999999999997,
													"value": 0.7850000000000001,
													"mode": 2
												},
												{
													"time": 0.245,
													"value": 1.0908097451790637,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061403662613847505,
														"dt": -0.08343956833586955
													},
													"nextHandle": {
														"dv": 0.32246091597796145,
														"dt": 0.4385714285714285
													}
												},
												{
													"time": 1,
													"value": 1.5405299586776862,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.03,
								"useRGB": false
							},
							"isInstance": true
						},
						{
							"type": "object",
							"name": "--------------------Thunder_Effect",
							"enabled": false,
							"y": 4.440892098500626e-16,
							"z": 4.934999999999999,
							"children": [
								{
									"type": "emitter",
									"name": "Thunder_SandStorm",
									"props": {
										"instScale_rand": 40,
										"maxCount": 5,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											0.6862745098039216,
											0.43137254901960786,
											1
										],
										"randomColor2": [
											0.5686274509803921,
											0.3607843137254902,
											0.32156862745098036,
											1
										],
										"emitAngle": 0,
										"emitRate": 3,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"lifeTime": 0.3,
										"instScale": 30,
										"lifeTimeRand": 0.3,
										"emitRad1": 0.52,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_08.png",
										"seedGroup": 2,
										"tag": null,
										"speedFactor": 0.25,
										"warmUpTime": -0.5,
										"useRandomColor": true,
										"alignMode": "Screen"
									},
									"z": 9.58676,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 20,
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
															"mode": "AfterTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 5,
															"drawOrder": "120"
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
														"scale": 0.8
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
															0.9098039215686274,
															0.9098039215686274,
															0.9098039215686274
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": -0.005000000000000002,
																	"value": 0.9460670471191408,
																	"mode": 2
																},
																{
																	"time": 0.37565000853983777,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.3907051535364237,
																	"value": 1.3700430939500274,
																	"mode": 2
																},
																{
																	"time": 0.4057602985330096,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.49335386942223663,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.5191059486354324,
																	"value": 2.142626922151249,
																	"mode": 2
																},
																{
																	"time": 0.5508371503182918,
																	"value": 0.9477534441713724,
																	"mode": 2
																},
																{
																	"time": 0.5918966366726169,
																	"value": 1.9553383990602566,
																	"mode": 2
																},
																{
																	"time": 0.6220069266657888,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.9641693129518321,
																	"value": 2.0855026729771486,
																	"mode": 2
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 0.6,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.01
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
																	"value": -0.020245897474978403,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8867282900325055,
																		"dt": -0.11018606649438058
																	},
																	"nextHandle": {
																		"dv": 0.5202458974749784,
																		"dt": 0.06365623589139441
																	}
																},
																{
																	"time": 0.27,
																	"value": 0.5657644565911942,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0591041572609296
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4408958427390704
																	}
																},
																{
																	"time": 0.8267766768764712,
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
														"range": 10,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.3,
													"dirIntensity": 0.3,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Thunder_SandStorm",
									"props": {
										"instScale_rand": 13,
										"maxCount": 2,
										"simulationSpace": "World",
										"animationSpeed": 0.1,
										"randomColor1": [
											1,
											0.9137254901960784,
											0.8862745098039215,
											1
										],
										"randomColor2": [
											1,
											0.7529411764705882,
											0.7058823529411764,
											1
										],
										"emitAngle": 0,
										"emitRate": 1,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"lifeTime": 0.5,
										"instScale": 13,
										"lifeTimeRand": 0.5,
										"emitRad1": 0.52,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_04.png",
										"seedGroup": 12,
										"tag": null,
										"speedFactor": 0.4,
										"warmUpTime": -1,
										"useRandomColor": true,
										"alignMode": "Screen"
									},
									"z": 9.58676,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 20,
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
															"culling": "None",
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true,
															"drawOrder": "120",
															"emissive": 5
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
														"texture": "Fx/Gradients/vGrad.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "vOffset",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
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
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.807843137254902,
															0.5647058823529412
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": -0.005000000000000002,
																	"value": 0.9460670471191408,
																	"mode": 2
																},
																{
																	"time": 0.37565000853983777,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.3907051535364237,
																	"value": 1.3700430939500274,
																	"mode": 2
																},
																{
																	"time": 0.4057602985330096,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.49335386942223663,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.5191059486354324,
																	"value": 2.142626922151249,
																	"mode": 2
																},
																{
																	"time": 0.5508371503182918,
																	"value": 0.9477534441713724,
																	"mode": 2
																},
																{
																	"time": 0.5918966366726169,
																	"value": 1.9553383990602566,
																	"mode": 2
																},
																{
																	"time": 0.6220069266657888,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.9641693129518321,
																	"value": 2.0855026729771486,
																	"mode": 2
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/NoisyWave_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.01
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
																	"value": -0.020245897474978403,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8867282900325055,
																		"dt": -0.11018606649438058
																	},
																	"nextHandle": {
																		"dv": 0.5202458974749784,
																		"dt": 0.06365623589139441
																	}
																},
																{
																	"time": 0.1935490769101309,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.09082531550800442,
																		"dt": -0.05814228744105057
																	},
																	"nextHandle": {
																		"dv": -0.6666666666666666,
																		"dt": 0.42681119327165606
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
														"range": 10,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.3,
													"dirIntensity": 0.3,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Thunder_SandStorm",
									"props": {
										"instScale_rand": 9,
										"maxCount": 10,
										"simulationSpace": "World",
										"animationSpeed": 0.2,
										"randomColor1": [
											1,
											0.8862745098039215,
											0.8117647058823529,
											1
										],
										"randomColor2": [
											0.6352941176470588,
											0.5215686274509804,
											0.48627450980392156,
											1
										],
										"emitAngle": 0,
										"emitRate": 2,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"lifeTime": 0.3,
										"instScale": 9,
										"lifeTimeRand": 0.3,
										"emitRad1": 0.52,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_04.png",
										"seedGroup": 15,
										"tag": null,
										"speedFactor": 0.4,
										"warmUpTime": -0.5,
										"useRandomColor": true,
										"alignMode": "Screen",
										"instStretch": [
											1,
											1.25,
											1
										],
										"instStretch_rand": [
											0,
											0.5,
											0
										]
									},
									"z": 9.58676,
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 40,
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
															"culling": "None",
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true,
															"drawOrder": "120",
															"emissive": 15
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
														"texture": "Fx/Gradients/vGrad.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "vOffset",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
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
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.8196078431372549,
															0.796078431372549
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": -0.005000000000000002,
																	"value": 0.9460670471191408,
																	"mode": 2
																},
																{
																	"time": 0.37565000853983777,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.3907051535364237,
																	"value": 1.3700430939500274,
																	"mode": 2
																},
																{
																	"time": 0.4057602985330096,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.49335386942223663,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.5191059486354324,
																	"value": 2.142626922151249,
																	"mode": 2
																},
																{
																	"time": 0.5508371503182918,
																	"value": 0.9477534441713724,
																	"mode": 2
																},
																{
																	"time": 0.5918966366726169,
																	"value": 1.9553383990602566,
																	"mode": 2
																},
																{
																	"time": 0.6220069266657888,
																	"value": 0.9631295109863263,
																	"mode": 2
																},
																{
																	"time": 0.9641693129518321,
																	"value": 2.0855026729771486,
																	"mode": 2
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/NoisyWave_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.01
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
																	"value": -0.020245897474978403,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8867282900325055,
																		"dt": -0.11018606649438058
																	},
																	"nextHandle": {
																		"dv": 0.5202458974749784,
																		"dt": 0.06365623589139441
																	}
																},
																{
																	"time": 0.1935490769101309,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.0591041572609296
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4408958427390704
																	}
																},
																{
																	"time": 0.8267766768764712,
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
														"range": 10,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.4,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.6,
													"envBlend": 0.7
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"x": -4.37806,
							"y": -3.67196,
							"scaleX": 130,
							"scaleY": 130,
							"scaleZ": 20,
							"rotationZ": 180,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalStrength": 0,
							"pbrStrength": 0,
							"fadePower": 2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 2.995,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.004701080322267,
													"value": 0.95,
													"mode": 2
												}
											]
										}
									]
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
										"alpha": 1.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle4.png",
										"onDecal": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"scale": 0.02,
										"rotation": 0,
										"useNormalMap": false,
										"onDecal": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 1.5,
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.18823529411764706,
											0.16078431372549018,
											0.15294117647058825
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 1,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"x": 0.003333333333333333,
							"y": 5.500823333333333,
							"z": -2.8414099999999998,
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 30,
							"albedoMap": "Fx/Alphas/T_circle4.png",
							"fadePower": 3,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle4.png",
										"onDecal": true
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 3.001967881321908,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.007715984047559546,
														"dt": -0.49999576628182163
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 1.081527777777779
													}
												},
												{
													"time": 4.002623841762544,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9066863196571489,
													"value": 0.0019257437500189156,
													"mode": 2
												},
												{
													"time": 0.9506423611111113,
													"value": 0.2771754531547245,
													"mode": 2
												},
												{
													"time": 1.01279743076826,
													"value": 0.0033808306929550558,
													"mode": 2
												},
												{
													"time": 1.05779743076826,
													"value": 0.0033808306929550558,
													"mode": 2
												},
												{
													"time": 1.0845312500000002,
													"value": 0.4566602877835921,
													"mode": 2
												},
												{
													"time": 1.3085501021146777,
													"value": -0.011995236121998737,
													"mode": 2
												},
												{
													"time": 3.284204177856446,
													"value": -0.0021206132303420167,
													"mode": 2
												},
												{
													"time": 3.499453125000003,
													"value": 0.32274514010021804,
													"mode": 2
												},
												{
													"time": 3.5999849307682634,
													"value": -0.0030840315589994033,
													"mode": 2
												},
												{
													"time": 3.6956250000000037,
													"value": 0.14932984094189194,
													"mode": 2
												},
												{
													"time": 3.78350055576826,
													"value": -0.006997918519169949,
													"mode": 2
												},
												{
													"time": 3.7878906250000033,
													"value": 0.32659881341484753,
													"mode": 2
												},
												{
													"time": 4.092426299750806,
													"value": -0.0030840315589993894,
													"mode": 2
												},
												{
													"time": 5.105911182761194,
													"value": -0.00866284390288985,
													"mode": 2
												},
												{
													"time": 5.436859731674192,
													"value": 0.4066744044969583,
													"mode": 2
												},
												{
													"time": 5.968705166592843,
													"value": -0.005330451683780935,
													"mode": 2
												},
												{
													"time": 7,
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
											0.8588235294117647,
											0.5450980392156862,
											0.4196078431372549
										]
									},
									"recursiveApply": false,
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.6,
									"dirBrighten": true,
									"dirIntensity": 0.6,
									"sandBlend": 0.6,
									"envBlend": 0.5,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.888420138888889,
													"value": -0.08077817223332065,
													"mode": 2
												},
												{
													"time": 0.9506423611111113,
													"value": 0.01068505720840815,
													"mode": 2
												},
												{
													"time": 0.9945312500000001,
													"value": -0.07932308529038451,
													"mode": 2
												},
												{
													"time": 1.0395312500000002,
													"value": -0.07932308529038451,
													"mode": 2
												},
												{
													"time": 1.1017521595954918,
													"value": 0.07989800385948961,
													"mode": 2
												},
												{
													"time": 1.1545312500000002,
													"value": -0.09469915210533836,
													"mode": 2
												},
												{
													"time": 3.408611111111115,
													"value": -0.08482452921368158,
													"mode": 2
												},
												{
													"time": 3.499453125000003,
													"value": 0.0562547441539015,
													"mode": 2
												},
												{
													"time": 3.5817187500000034,
													"value": -0.08578794754233897,
													"mode": 2
												},
												{
													"time": 3.6842215132713356,
													"value": 0.002300656971510495,
													"mode": 2
												},
												{
													"time": 3.765234375,
													"value": -0.08970183450250951,
													"mode": 2
												},
												{
													"time": 3.7878906250000033,
													"value": 0.06010841746853099,
													"mode": 2
												},
												{
													"time": 3.917109375000004,
													"value": -0.08578794754233895,
													"mode": 2
												},
												{
													"time": 5.3017072963714575,
													"value": -0.09136675988622942,
													"mode": 2
												},
												{
													"time": 5.526305010318767,
													"value": 0.06151935586319193,
													"mode": 2
												},
												{
													"time": 5.950438985824583,
													"value": -0.0880343676671205,
													"mode": 2
												},
												{
													"time": 7,
													"value": 0,
													"mode": 2
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
					"name": "Spirale",
					"z": -0.3289,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "object",
							"name": "Bol",
							"z": -0.31467,
							"children": [
								{
									"type": "emitter",
									"name": "BolSharpInfinty",
									"enabled": false,
									"props": {
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"emitRate": 2,
										"instScale": 6
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleZ": 1.4,
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
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": -0.02,
														"texture": "Fx/Gradients/GradientSpice_2.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.0031778692272519393,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5056226185032769,
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
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 1,
														"width": 0.37,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.2,
															0.1
														],
														"uvScaleSpeed": [
															0,
															0
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
														"progress": 0.34,
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 3,
														"uvScaleY": 4,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.25,
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
																	"time": 0.2090824569425393,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11604552724598342,
																		"dt": -0.49988189441195807
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.2871757354061881
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
														"range": 10,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.14509803921568626,
															0.09411764705882353,
															0.17254901960784313
														]
													}
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
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "BolSharpInfinty",
									"props": {
										"lifeTime": 5,
										"instRotation": [
											0,
											180,
											0
										],
										"emitRate": 2,
										"instScale": 7
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleZ": 1.4,
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
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0
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
														"vOffset": -0.02,
														"texture": "Fx/Gradients/GradientSpice_2.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.06168610084980068,
																		"dt": -0.4996574168833835
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.135
																	}
																},
																{
																	"time": 0.315,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.75,
																		"dt": -0.14562261850327696
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.14437738149672297
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
														"width": 0.37,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.2,
															0.1
														],
														"uvScaleSpeed": [
															0,
															0
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
														"progress": 0.34,
														"saturation": 0,
														"width": 0.5,
														"uvScaleX": 3,
														"uvScaleY": 4,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.25,
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
																	"time": 0.2090824569425393,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11604552724598342,
																		"dt": -0.49988189441195807
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.2871757354061881
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
														"range": 10,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"enabled": false,
													"props": {
														"alpha": 5
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.14509803921568626,
															0.09411764705882353,
															0.17254901960784313
														]
													}
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
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Swirl",
							"source": "Fx/Event/Swirl.fbx",
							"enabled": false,
							"z": 1.88795,
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 3.5,
							"rotationZ": 73.4,
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
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0
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
										"alpha": 0.55,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl01v_A.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keys": [
												{
													"time": -0.0031778692272519393,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5056226185032769,
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
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 1,
										"width": 0.37,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.3
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.34,
										"saturation": 0.5,
										"width": 0.4,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2090824569425393,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
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
										"range": 5,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 7,
											"value": 1,
											"mode": 2
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
									"topIntensity": 0.42,
									"topSpan": 0.24,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 0.58,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.1
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2090824569425393,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.4
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "SwirlInside",
							"source": "Fx/Event/Swirl.fbx",
							"enabled": false,
							"z": 1.90324,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 7,
							"rotationZ": 91.6,
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
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0
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
										"alpha": 0.8,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl01v_A.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keys": [
												{
													"time": -0.0031778692272519393,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5056226185032769,
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
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.4
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.58,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.1
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2090824569425393,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
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
										"range": 5,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5,
											"value": 1,
											"mode": 2
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
									"topIntensity": 0.42,
									"topSpan": 0.24,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0.5,
										"width": 0.4,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.1
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2090824569425393,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 1,
										"width": 0.37,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.4
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Hemisphere",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"enabled": false,
							"z": 0.23658,
							"scaleX": 7.14,
							"scaleY": 7.14,
							"scaleZ": 50,
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
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": -0.02,
										"texture": "Fx/Gradients/GradientSpice_2.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": -0.0031778692272519393,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5056226185032769,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0050000000000003,
													"value": 1,
													"mode": 2
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
										"useScale": true,
										"wrap": true,
										"progress": 0.23,
										"saturation": 0.5,
										"width": 0.61,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.2,
											0.1
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 3,
										"uvScaleY": 4,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.25,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.204082456942539,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
													}
												},
												{
													"time": 2.9949999999999997,
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
										"range": 10,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 5
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.14509803921568626,
											0.09411764705882353,
											0.17254901960784313
										]
									}
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
									}
								}
							]
						},
						{
							"type": "model",
							"name": "SandCloud_bottom",
							"source": "Fx/Meshes_Common/SandCloud_bottom.fbx",
							"enabled": false,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
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
											"enableStencil": false,
											"parallax": 0
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
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": -0.02,
										"texture": "Fx/Gradients/GradientSpice_2.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06168610084980068,
														"dt": -0.4996574168833835
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.135
													}
												},
												{
													"time": 0.315,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.75,
														"dt": -0.14562261850327696
													},
													"nextHandle": {
														"dv": -0.33333333333333337,
														"dt": 0.14437738149672297
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 0.37,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											1
										],
										"uvShiftSpeed": [
											0.25,
											0.1
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.2,
											0.4
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2090824569425393,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
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
										"range": 5,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 5
									}
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
									}
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"enabled": false,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 30,
					"albedoMap": "Fx/Alphas/T_PosionAlpha03.png",
					"children": [
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.9176470588235294,
									0.8627450980392157,
									0.8156862745098039
								]
							}
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
							}
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 9,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.3,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/causticTexture_03-2-Blured.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"enabled": false,
					"x": -51.69755,
					"y": 3.79847,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 30,
					"rotationZ": -104.8,
					"albedoMap": "Fx/Alphas/T_PosionAlpha03.png",
					"albedoStrength": 2,
					"children": [
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 2
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.8313725490196078,
									0.7098039215686275,
									0.796078431372549
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.7,
								"envColorSet": false
							}
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 18,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.3,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 0.75,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/T_Noise_Grunge_04.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.01,
									0.005
								]
							}
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.3,
								"saturation": 0.25,
								"width": 1,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/causticTexture_03-2-Blured.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							}
						}
					]
				}
			]
		},
		{
			"type": "polygon",
			"name": "Sol",
			"editorOnly": true,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		}
	]
}