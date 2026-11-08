{
	"type": "fx",
	"duration": 6,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 200,
			"scaleY": 200,
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
		},
		{
			"type": "object",
			"name": "caca",
			"enabled": false,
			"children": [
				{
					"type": "object",
					"name": "ExplosionSlow",
					"z": 2,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "object",
							"name": "ShockWave",
							"z": -1,
							"scaleX": 0.725,
							"scaleY": 0.725,
							"scaleZ": 0.725,
							"children": [
								{
									"type": "emitter",
									"name": "Distort",
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
										"lifeTime": 1.8,
										"emitType": "Burst",
										"burstDelay": 0.1,
										"instScale": 125,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -1.25,
										"instStretch": [
											1,
											1,
											0.01
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
															"blend": "Alpha",
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
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle5.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
														"intensity": 0.06
													},
													"isInstance": true,
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
																		"dv": 1.1438836500205134,
																		"dt": -0.4763721338556696
																	},
																	"nextHandle": {
																		"dv": -0.2551111111111112,
																		"dt": 0.10551280456700678
																	}
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
													]
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 3,
														"power": 1
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
													"value": 0.012707392165911546,
													"mode": 0,
													"prevHandle": {
														"dv": -2.476916055641238,
														"dt": -0.11081055179448417
													},
													"nextHandle": {
														"dv": 1.1289962707111405,
														"dt": 0.05
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.12648137998854092,
														"dt": -0.69
													},
													"nextHandle": {
														"dv": 0.04797846416818524,
														"dt": 0.2699185912801351
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand_Outline_ShockWave",
									"props": {
										"warmUpTime": -1.25,
										"emitType": "Burst",
										"instScale": 235,
										"lifeTime": 3.5,
										"instRotation_rand": [
											0,
											0,
											360
										]
									},
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
															"drawOrder": "100"
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
														"alpha": 4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SmokeDonut.png",
														"onDecal": false
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
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.5708015990978788
																	},
																	"nextHandle": {
																		"dv": 0.009785546759570019,
																		"dt": 0.33328019978181483
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
														"envBlend": 0.8,
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
														"progress": 0.21,
														"saturation": 1,
														"width": 0.85,
														"uvScaleX": 2,
														"uvScaleY": 2.25,
														"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.4,
														"saturation": 1,
														"width": 0.89,
														"uvScaleX": 2,
														"uvScaleY": 2.25,
														"texture": "Fx/noise/Water_01.png",
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.018518518518518517,
																		"dt": -0.396417005838842
																	},
																	"nextHandle": {
																		"dv": 0.015545183847661867,
																		"dt": 0.33332690372627816
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
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6427171614302516
																	},
																	"nextHandle": {
																		"dv": -5.586119418547156e-16,
																		"dt": 0.3333346467126276
																	}
																}
															]
														}
													]
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
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -2.494073049921499,
														"dt": -0.0712919490177076
													},
													"nextHandle": {
														"dv": 0.6127090979023997,
														"dt": 0.018205260047565522
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0010974281668227892,
														"dt": -1.0012819571088818
													},
													"nextHandle": {
														"dv": -1.6811564388663527e-16,
														"dt": 0.2703197486375193
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "SandWave",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"x": -0.25,
									"y": 0.23,
									"z": -1,
									"scaleX": 240,
									"scaleY": 240,
									"scaleZ": 180,
									"rotationX": -1.3,
									"rotationY": -0.9,
									"rotationZ": 81.8,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "DecalPass",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"parallax": 0,
													"alphaKill": false,
													"textureWrap": true,
													"culling": "None"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"normalMap": "Fx/DistortionMaps/water-normal.png",
											"materialName": "any",
											"mainPassName": "decal",
											"color": [
												1,
												1,
												1,
												0.4784313725490196
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": true,
												"replace": false,
												"alpha": 2,
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
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": -0.04,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.005924658713239328,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.9959789400858212,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.006011617171094308,
																"dt": -0.544468412002264
															},
															"nextHandle": {
																"dv": -0.010561100362489473,
																"dt": 0.8971306246332782
															}
														},
														{
															"time": 3.094375000000001,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.004551823188861104,
																"dt": -0.774873962402344
															},
															"nextHandle": {
																"dv": -0.004551823188861104,
																"dt": 0.774873962402344
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
												"range": 1,
												"power": 0.5
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
												"saturation": 0.5,
												"width": 0.32,
												"uvScaleX": 6,
												"uvScaleY": 3,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
															"time": 1.2948342337155019,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.185,
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.018518518518518517,
																"dt": -0.396417005838842
															},
															"nextHandle": {
																"dv": 0.015545183847661867,
																"dt": 0.33332690372627816
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.36,
												"sandColorSet": false,
												"envBlend": 0.67,
												"envColorSet": false
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 4,
												"scrollSpeed": [
													0.07,
													0
												],
												"smoothEdge": 1,
												"texScaleX": 0,
												"texScaleY": 0
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 4,
												"scaleY": 2,
												"shiftX": 1,
												"shiftY": 1,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.05
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.023020744572424055,
																"dt": -1.0331230136552487
															},
															"nextHandle": {
																"dv": -0.03722222756339133,
																"dt": 1.7789013494220134
															}
														},
														{
															"time": 5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.20587436996747438,
																"dt": -0.24142791275560516
															},
															"nextHandle": {
																"dv": -0.20587436996747438,
																"dt": 0.24142791275560516
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2948342337155019,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.082155997157843e-17,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8751657662844985
															}
														},
														{
															"time": 2.294834233715502,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0.16666666666666663,
																"dt": -0.17983423371550167
															},
															"nextHandle": {
																"dv": -0.18034096476699873,
																"dt": 0.19476824194835848
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.2212500000000004,
													"value": 0.012707392165911546,
													"mode": 0,
													"prevHandle": {
														"dv": -2.476916055641238,
														"dt": -0.11081055179448417
													},
													"nextHandle": {
														"dv": 1.1289962707111405,
														"dt": 0.05
													}
												},
												{
													"time": 2.2946155619504136,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.12648137998854092,
														"dt": -0.69
													},
													"nextHandle": {
														"dv": 0.04797846416818524,
														"dt": 0.2699185912801351
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.2,
												"scale": 1,
												"power": 1,
												"color": [
													0,
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 1.2999999999999998,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -2.5006337470412325,
														"dt": -2.1917661973800806e-16
													},
													"nextHandle": {
														"dv": 0.45382975945507686,
														"dt": 0
													}
												},
												{
													"time": 2.3,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0014204545454546968,
														"dt": -1.0071428571428571
													},
													"nextHandle": {
														"dv": 0.00038125361632792724,
														"dt": 0.27031970693702584
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Ring_2",
									"source": "Fx/Meshes_Common/Ring_4.fbx",
									"enabled": false,
									"z": 3.50117,
									"scaleX": 75,
									"scaleY": 75,
									"scaleZ": 15,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"alphaKill": false,
													"enableStencil": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Alphas/T_Nuke.png"
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 1,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0.03
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScale": 1,
												"tex": "Fx/Alphas/T_NukeVertex.png",
												"intensity": 2.12,
												"scrollSpeed": [
													0,
													0.03
												],
												"smoothEdge": 0,
												"texScaleX": 0.5,
												"texScaleY": 1
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
												"progress": 0.42,
												"saturation": 1,
												"width": 0.3,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.03
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
															"value": 0.72,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0015783140462086538,
																"dt": -0.7956406277032685
															},
															"nextHandle": {
																"dv": 0.004666666666666708,
																"dt": 2.345801289901138
															}
														},
														{
															"time": 3.832352692671121,
															"value": 1,
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
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 3.3272724800873203
															}
														},
														{
															"time": 6,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.2411982586234789,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.494281554333866,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.007847719565506733,
																"dt": -0.3329917793614515
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.7071943566575647
															}
														},
														{
															"time": 2.3169362141191967,
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
												"range": 0.9,
												"power": 1.52
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
													0.796078431372549,
													0.580392156862745
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"enabled": false,
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
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.2344958722963932,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 1.541220170911402,
														"dt": 0.14432537890970698
													}
												},
												{
													"time": 2.1581782973185186,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.041220170911401954,
														"dt": -1.053575266040862
													},
													"nextHandle": {
														"dv": -0.041220170911401954,
														"dt": 1.053575266040862
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -2.494073049921499,
														"dt": -0.0712919490177076
													},
													"nextHandle": {
														"dv": 0.6127090979023997,
														"dt": 0.018205260047565522
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0010974281668227892,
														"dt": -1.0012819571088818
													},
													"nextHandle": {
														"dv": -1.6811564388663527e-16,
														"dt": 0.2703197486375193
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FireExplo_floor",
							"props": {
								"warmUpTime": -1.25,
								"emitType": "Burst",
								"instScale": 55,
								"lifeTime": 4.5,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5
							},
							"z": -0.75,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 30,
													"drawOrder": "-80",
													"depthWrite": "Off"
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.38408525123202764
															},
															"nextHandle": {
																"dv": 0.014436864824411356,
																"dt": 0.3332756687015779
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.4258279990287213,
																"dt": -0.24442765697635202
															},
															"nextHandle": {
																"dv": -1.1666666666666665,
																"dt": 0.20000000000000007
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333326,
																"dt": -0.33999999999999986
															},
															"nextHandle": {
																"dv": -0.03266568666923559,
																"dt": 0.33319000402620214
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02018778987695988,
																"dt": -1.1385913490605288
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.94
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
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.245041497761005,
																"dt": -0.020614551575750532
															},
															"nextHandle": {
																"dv": -0.446875,
																"dt": 0.0067260711913458004
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.7109224214778171
															},
															"nextHandle": {
																"dv": 0.007810578034972692,
																"dt": 0.33333208232392514
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2.25,
												"texture": "Fx/noise/Water_01.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02018778987695988,
																"dt": -1.1385913490605288
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.94
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2177795461420868,
																"dt": -0.0988648016929929
															},
															"nextHandle": {
																"dv": -0.7015380859375002,
																"dt": 0.056053089618603016
															}
														},
														{
															"time": 1,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.014721679687500211,
																"dt": -0.606056834154685
															},
															"nextHandle": {
																"dv": 0.007243080094943305,
																"dt": 0.333333876231921
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.229552882459761,
																"dt": -0.1737100874637916
															},
															"nextHandle": {
																"dv": -0.7417695473251028,
																"dt": 0.105
															}
														},
														{
															"time": 1,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0014403292181069394,
																"dt": -0.385
															},
															"nextHandle": {
																"dv": -9.409347310140472e-17,
																"dt": 0.3334009968594422
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
												"range": 5,
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -2.494073049921499,
												"dt": -0.0712919490177076
											},
											"nextHandle": {
												"dv": 0.6127090979023997,
												"dt": 0.018205260047565522
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010974281668227892,
												"dt": -1.0012819571088818
											},
											"nextHandle": {
												"dv": -1.6811564388663527e-16,
												"dt": 0.2703197486375193
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
					"name": "LensFlare",
					"x": -1.51052,
					"y": -0.5043,
					"z": -6.32523,
					"scaleX": 10.5,
					"scaleY": 10.5,
					"scaleZ": 10.5,
					"children": [
						{
							"type": "emitter",
							"name": "LensFlare_circle",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 1.5,
								"maxCount": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									150
								],
								"instScale": 7,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -1.28,
								"instOffset": [
									1.25,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									25
								],
								"instOffset_rand": [
									0.2,
									0,
									0
								],
								"lifeTime": 1.8
							},
							"x": 0.05686,
							"y": -0.145,
							"z": 2.75,
							"scaleX": 0.09999999999999999,
							"scaleY": 0.09999999999999999,
							"scaleZ": 0.09999999999999999,
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
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 10
												}
											},
											"wrapRepeat": true,
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
												"alpha": 0.2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_01.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
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
												"range": 5,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LensFlare_color_big2",
							"props": {
								"alignMode": "Screen",
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
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale": 10.5,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -1.3,
								"instRotation": [
									20,
									0,
									0
								],
								"lifeTime": 3
							},
							"z": 1.25,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 15
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/T_circleGradient_color_double.png",
											"color": [
												0.9411764705882353,
												0.807843137254902,
												0.7058823529411764,
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
												"alpha": 0.2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_Double.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
												"range": 24.24,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
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
					"name": "Debris",
					"z": -3.3324,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "DebrisCylinder",
							"props": {
								"lifeTime": 1.75,
								"lifeTimeRand": 0.75,
								"warmUpTime": -0.6,
								"emitType": "Burst",
								"burstParticleCount": 7,
								"emitShape": "Cylinder",
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale": 3,
								"instSpeed": [
									75,
									0,
									65
								],
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 2.5,
								"instSpeed_rand": [
									90,
									0,
									7
								],
								"instWorldSpeed": [
									0,
									0,
									-15
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-6
								],
								"seedGroup": 1,
								"randomColor1": [
									0.9294117647058824,
									0.36470588235294116,
									0.19215686274509802,
									1
								],
								"randomColor2": [
									0.19607843137254902,
									0.19607843137254902,
									0.19607843137254902,
									1
								],
								"simulationSpace": "World",
								"emitOrientation": "Normal",
								"emitRad1": 0.7,
								"speedFactor": 0.5
							},
							"z": 10.13105,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 5,
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
													"textureWrap": true,
													"emissive": 25
												}
											},
											"wrapRepeat": true
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.63,
															"value": 1.0142450142450146,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.21166666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12166666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16500000000000004
															},
															"nextHandle": {
																"dv": -1.860811850556283e-16,
																"dt": 0.33333333333333337
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
													1,
													1,
													1
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0.2628260520650284,
															"mode": 2
														},
														{
															"time": 0.295,
															"value": 0.2628205811313724,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.2628,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.295,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.19
															},
															"nextHandle": {
																"dv": -2.1499354918364647e-16,
																"dt": 0.26333333333333336
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
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.295,
															"value": 0.05882,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009403613664215618,
																"dt": -0.21999999999999997
															},
															"nextHandle": {
																"dv": -0.01119188451440024,
																"dt": 0.26326535002683493
															}
														},
														{
															"time": 1,
															"value": 0.058823529411764705,
															"mode": 2
														}
													]
												}
											]
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
												"dv": 3.022033566727083,
												"dt": -0.2526618227919364
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.085
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.5253769144228198
											},
											"nextHandle": {
												"dv": -0.020808987292503984,
												"dt": 0.6554830997138851
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.9713780548902946,
												"dt": -0.3019303507388523
											},
											"nextHandle": {
												"dv": -1.0333333333333332,
												"dt": 0.105
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.6053769144228197
											},
											"nextHandle": {
												"dv": -0.0180575879092897,
												"dt": 0.6554904411072038
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "InstWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03316093014576553,
												"dt": -0.4999010219474131
											},
											"nextHandle": {
												"dv": 0.06666666666666665,
												"dt": 1.005
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -1.1666666666666665,
												"dt": -0.010000000000000009
											},
											"nextHandle": {
												"dv": 0.7916682837335377,
												"dt": 0.006785728146287541
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
											"value": 0.012707392165911546,
											"mode": 0,
											"prevHandle": {
												"dv": -1.562544836391683,
												"dt": -0.057312053992565525
											},
											"nextHandle": {
												"dv": 0.8951335055594681,
												"dt": 0.03233660096897972
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024099204996862578,
												"dt": -0.9873942064019231
											},
											"nextHandle": {
												"dv": 0.0055778337215589505,
												"dt": 0.265963721460112
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
					"name": "BaseArrakeen",
					"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
					"z": -1,
					"rotationZ": 180
				},
				{
					"type": "object",
					"name": "TESTDECALS",
					"x": 0.1623800000000005,
					"y": 1.0936233333333334,
					"z": 1.4188933333333331,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": 10.56353,
							"y": -4.366463333333334,
							"z": 0.4882366666666669,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 61.39999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.0573,
									"y": -0.2022,
									"z": -0.19,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 2.5,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.75,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"x": 0.04591,
									"y": 0.07799,
									"z": -0.19293,
									"scaleX": 4.619999999999998,
									"scaleY": 4.619999999999998,
									"scaleZ": 2.419999999999999,
									"rotationZ": 55.5,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.95,
									"children": [
										{
											"type": "curve",
											"name": "color.a",
											"keys": [
												{
													"time": 1.4899999999999984,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.695,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.15,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
							"type": "object",
							"name": "Decals",
							"locked": true,
							"x": -9.28151,
							"y": -8.240763333333334,
							"z": -1.4188933333333331,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.02318,
									"y": 0.11077,
									"scaleX": 6,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"name": "Decal_tour",
									"x": 1.05635,
									"y": 1.04769,
									"z": 0.75656,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": -1.2820200000000004,
							"y": 12.607226666666667,
							"z": 0.9306566666666667,
							"scaleX": 8.200000000000001,
							"scaleY": 8.200000000000001,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.33745,
									"y": -0.36061,
									"z": -0.3,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 1.73,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.1923,
									"y": 0.28425,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.56,
									"rotationZ": 23.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "ExplosionSlow",
					"z": 2,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "emitter",
							"name": "FireExplo_floor",
							"props": {
								"warmUpTime": -1.25,
								"emitType": "Burst",
								"instScale": 50,
								"lifeTime": 4.5,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5
							},
							"z": -0.75,
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
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 200,
													"drawOrder": "-80",
													"depthWrite": "Off"
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.2
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.38408525123202764
															},
															"nextHandle": {
																"dv": 0.014436864824411356,
																"dt": 0.3332756687015779
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.4258279990287213,
																"dt": -0.24442765697635202
															},
															"nextHandle": {
																"dv": -1.1666666666666665,
																"dt": 0.20000000000000007
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333326,
																"dt": -0.33999999999999986
															},
															"nextHandle": {
																"dv": -0.03266568666923559,
																"dt": 0.33319000402620214
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02018778987695988,
																"dt": -1.1385913490605288
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.94
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
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.245041497761005,
																"dt": -0.020614551575750532
															},
															"nextHandle": {
																"dv": -0.446875,
																"dt": 0.0067260711913458004
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.7109224214778171
															},
															"nextHandle": {
																"dv": 0.007810578034972692,
																"dt": 0.33333208232392514
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2.25,
												"texture": "Fx/noise/Water_01.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02018778987695988,
																"dt": -1.1385913490605288
															},
															"nextHandle": {
																"dv": 0.016666666666666607,
																"dt": 0.94
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2177795461420868,
																"dt": -0.0988648016929929
															},
															"nextHandle": {
																"dv": -0.7015380859375002,
																"dt": 0.056053089618603016
															}
														},
														{
															"time": 1,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.014721679687500211,
																"dt": -0.606056834154685
															},
															"nextHandle": {
																"dv": 0.007243080094943305,
																"dt": 0.333333876231921
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.229552882459761,
																"dt": -0.1737100874637916
															},
															"nextHandle": {
																"dv": -0.7417695473251028,
																"dt": 0.105
															}
														},
														{
															"time": 1,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0014403292181069394,
																"dt": -0.385
															},
															"nextHandle": {
																"dv": -9.409347310140472e-17,
																"dt": 0.3334009968594422
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
												"range": 5,
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
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -2.494073049921499,
												"dt": -0.0712919490177076
											},
											"nextHandle": {
												"dv": 0.6127090979023997,
												"dt": 0.018205260047565522
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010974281668227892,
												"dt": -1.0012819571088818
											},
											"nextHandle": {
												"dv": -1.6811564388663527e-16,
												"dt": 0.2703197486375193
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
					"name": "LensFlare",
					"x": -1.51052,
					"y": -0.5043,
					"z": -6.32523,
					"scaleX": 10,
					"scaleY": 10,
					"scaleZ": 10,
					"children": [
						{
							"type": "emitter",
							"name": "LensFlare_circle",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 1.5,
								"maxCount": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									150
								],
								"instScale": 7,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -1.28,
								"instOffset": [
									1.25,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									25
								],
								"instOffset_rand": [
									0.2,
									0,
									0
								],
								"lifeTime": 1.8
							},
							"x": 0.05686,
							"y": -0.145,
							"z": 2.75,
							"scaleX": 0.09999999999999999,
							"scaleY": 0.09999999999999999,
							"scaleZ": 0.09999999999999999,
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
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 10
												}
											},
											"wrapRepeat": true,
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
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_01.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
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
												"range": 5,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LensFlare_color_big2",
							"props": {
								"alignMode": "Screen",
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
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale": 10.5,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -1.3,
								"instRotation": [
									20,
									0,
									0
								],
								"lifeTime": 3
							},
							"z": 1.25,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 8
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/T_circleGradient_color_double.png",
											"color": [
												0.9411764705882353,
												0.807843137254902,
												0.7058823529411764,
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
												"alpha": 0.55,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_Double.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
												"range": 24.24,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
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
					"name": "Debris",
					"z": -3.3324,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "DebrisCylinder",
							"props": {
								"lifeTime": 1.75,
								"lifeTimeRand": 0.75,
								"warmUpTime": -0.6,
								"emitType": "Burst",
								"burstParticleCount": 7,
								"emitShape": "Cylinder",
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale": 3,
								"instSpeed": [
									75,
									0,
									65
								],
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 2.5,
								"instSpeed_rand": [
									90,
									0,
									7
								],
								"instWorldSpeed": [
									0,
									0,
									-15
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-6
								],
								"seedGroup": 1,
								"randomColor1": [
									0.9294117647058824,
									0.36470588235294116,
									0.19215686274509802,
									1
								],
								"randomColor2": [
									0.19607843137254902,
									0.19607843137254902,
									0.19607843137254902,
									1
								],
								"simulationSpace": "World",
								"emitOrientation": "Normal",
								"emitRad1": 0.7,
								"speedFactor": 0.5,
								"emitAngle": 360
							},
							"z": 10.13105,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 5,
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
													"textureWrap": true,
													"emissive": 25
												}
											},
											"wrapRepeat": true
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.63,
															"value": 1.0142450142450146,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.21166666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12166666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16500000000000004
															},
															"nextHandle": {
																"dv": -1.860811850556283e-16,
																"dt": 0.33333333333333337
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
													1,
													1,
													1
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0.2628260520650284,
															"mode": 2
														},
														{
															"time": 0.295,
															"value": 0.2628205811313724,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.2628,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.295,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.19
															},
															"nextHandle": {
																"dv": -2.1499354918364647e-16,
																"dt": 0.26333333333333336
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
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.295,
															"value": 0.05882,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009403613664215618,
																"dt": -0.21999999999999997
															},
															"nextHandle": {
																"dv": -0.01119188451440024,
																"dt": 0.26326535002683493
															}
														},
														{
															"time": 1,
															"value": 0.058823529411764705,
															"mode": 2
														}
													]
												}
											]
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
												"dv": 3.022033566727083,
												"dt": -0.2526618227919364
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.085
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.5253769144228198
											},
											"nextHandle": {
												"dv": -0.020808987292503984,
												"dt": 0.6554830997138851
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.9713780548902946,
												"dt": -0.3019303507388523
											},
											"nextHandle": {
												"dv": -1.0333333333333332,
												"dt": 0.105
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.6053769144228197
											},
											"nextHandle": {
												"dv": -0.0180575879092897,
												"dt": 0.6554904411072038
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "InstWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03316093014576553,
												"dt": -0.4999010219474131
											},
											"nextHandle": {
												"dv": 0.06666666666666665,
												"dt": 1.005
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -1.1666666666666665,
												"dt": -0.010000000000000009
											},
											"nextHandle": {
												"dv": 0.7916682837335377,
												"dt": 0.006785728146287541
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
											"value": 0.012707392165911546,
											"mode": 0,
											"prevHandle": {
												"dv": -1.562544836391683,
												"dt": -0.057312053992565525
											},
											"nextHandle": {
												"dv": 0.8951335055594681,
												"dt": 0.03233660096897972
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024099204996862578,
												"dt": -0.9873942064019231
											},
											"nextHandle": {
												"dv": 0.0055778337215589505,
												"dt": 0.265963721460112
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
					"name": "BaseArrakeen_mesh",
					"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
					"editorOnly": true,
					"z": -1,
					"rotationZ": 180
				},
				{
					"type": "object",
					"name": "TESTDECALS",
					"editorOnly": true,
					"x": 0.1623800000000005,
					"y": 1.0936233333333334,
					"z": 1.4188933333333331,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": 10.56353,
							"y": -4.366463333333334,
							"z": 0.4882366666666669,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 61.39999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.0573,
									"y": -0.2022,
									"z": -0.19,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 2.5,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.75,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"x": 0.04591,
									"y": 0.07799,
									"z": -0.19293,
									"scaleX": 4.619999999999998,
									"scaleY": 4.619999999999998,
									"scaleZ": 2.419999999999999,
									"rotationZ": 55.5,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.95,
									"children": [
										{
											"type": "curve",
											"name": "color.a",
											"keys": [
												{
													"time": 1.4899999999999984,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.695,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.15,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
							"type": "object",
							"name": "Decals",
							"locked": true,
							"x": -9.28151,
							"y": -8.240763333333334,
							"z": -1.4188933333333331,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.02318,
									"y": 0.11077,
									"scaleX": 6,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"name": "Decal_tour",
									"x": 1.05635,
									"y": 1.04769,
									"z": 0.75656,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": -1.2820200000000004,
							"y": 12.607226666666667,
							"z": 0.9306566666666667,
							"scaleX": 8.200000000000001,
							"scaleY": 8.200000000000001,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.33745,
									"y": -0.36061,
									"z": -0.3,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 1.73,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.1923,
									"y": 0.28425,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.56,
									"rotationZ": 23.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				}
			]
		}
	]
}