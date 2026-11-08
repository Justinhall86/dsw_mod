{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
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
		},
		{
			"type": "object",
			"name": "Otheym",
			"editorOnly": true,
			"children": [
				{
					"type": "model",
					"name": "Male01_HarkonnenRabban",
					"source": "Character/Fremen/Unit/Otheym/Male01_FremenOtheym.fbx",
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_Skill.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "Bazooka",
					"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
					"rotationX": -98.5,
					"rotationY": -0.7,
					"rotationZ": 2
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.Otheym.Bazooka",
					"target": "FXAnimation.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.36,
			"scaleY": 0.36,
			"scaleZ": 0.36,
			"rotationX": 8,
			"children": [
				{
					"type": "model",
					"name": "Bazooka_mat",
					"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
					"x": -0.00012000000000012001,
					"y": 0.0010200000000000209,
					"z": 0.006760000000000099,
					"scaleX": 1.1000000000000005,
					"scaleY": 1.0100000000000007,
					"scaleZ": 1.100000000000001,
					"rotationX": -98.5,
					"rotationY": -0.7,
					"rotationZ": 2,
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
									"emissive": 2
								}
							}
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": false,
								"ALPHA": true,
								"REVERSE": false,
								"bias": -0.15,
								"scale": 1,
								"power": 1,
								"color": [
									0,
									0,
									0
								]
							}
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.4511179929140826,
											"value": 0,
											"mode": 1
										},
										{
											"time": 0.4611179929140826,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.6732068509640925,
											"value": 0,
											"mode": 1
										},
										{
											"time": 1.0222470186344375,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.11384693995679285
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.06526080676176826
											}
										},
										{
											"time": 1.0845414250888525,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaCycle",
							"source": "shaders/AlphaCycle.hx",
							"enabled": false,
							"props": {
								"minAlpha": 0.5,
								"maxAlpha": 1,
								"frequency": 2
							}
						},
						{
							"type": "shader",
							"name": "GradientMap",
							"source": "hrt.shader.GradientMap",
							"props": {
								"USE_ALPHA": true,
								"gradient": {
									"type": "gradient",
									"data": {
										"stops": [
											{
												"position": 0,
												"color": -319772357
											}
										],
										"resolution": 64,
										"isVertical": false,
										"interpolation": "Linear",
										"colorMode": 0
									}
								}
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Skill",
					"children": [
						{
							"type": "object",
							"name": "DecalBazooka",
							"y": 0.0535,
							"z": 0.0304,
							"rotationX": -9.6,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"enabled": false,
									"y": -0.06944,
									"z": 0.0304,
									"scaleX": 2.5,
									"scaleY": 0.6,
									"scaleZ": 0.59,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"fadePower": 3,
									"emissive": 10,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.020765715723985,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0526133253082968,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1832508968329853,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08163119444600841
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08163119444600841
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
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
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
													0.9450980392156862,
													0.3058823529411765,
													0.16078431372549018
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.1300033629211388,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.00978182452443758
															},
															"nextHandle": {
																"dv": -0.03417340777450917,
																"dt": 0.09904221378551759
															}
														},
														{
															"time": 1.2350481351179,
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
											"enabled": false,
											"props": {
												"amount": 0.7,
												"color": [
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Red",
									"enabled": false,
									"z": 0.0304,
									"scaleX": 2.5,
									"scaleY": 0.6,
									"scaleZ": 0.59,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"fadePower": 3,
									"emissive": 10,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.25
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.45620653458493066,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.46620653458493067,
															"value": 0.5,
															"mode": 1
														},
														{
															"time": 0.6732068509640925,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.9909789580933015,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08294614300775238
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.11003003950926027
															}
														},
														{
															"time": 1.0639333685570502,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2340860971668897,
															"value": 0.05,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.47008708821305567,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.4800870882130557,
															"value": 0.5,
															"mode": 1
														},
														{
															"time": 0.585988651789465,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.0001814337771993,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08294614300775238
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.11003003950926027
															}
														},
														{
															"time": 1.073135844240948,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2340860971668897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.967162280383077,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.977162280383077,
															"value": 1,
															"mode": 1
														},
														{
															"time": 2.2142454653587293,
															"value": 0.2,
															"mode": 1
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
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.75
											}
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.04938,
									"y": -0.14264,
									"z": -0.04748,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"rotationY": -38.3155323490468,
									"rotationZ": 42.31532939996876,
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": -90,
											"rotationZ": -90,
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
															"drawOrder": "100",
															"emissive": 0.5
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"enabled": false,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
											"rotationX": -90,
											"rotationZ": -90,
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
															"emissive": 1,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 3
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "elec",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": -90,
											"rotationZ": -90,
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
															"drawOrder": "100",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1701327223836298,
																	"value": 0.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.26643086747757283,
																		"dt": -0.07011519803730601
																	},
																	"nextHandle": {
																		"dv": -0.26643086747757283,
																		"dt": 0.07011519803730601
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricStar_4x4.png",
														"speed": 20,
														"frameDivision": [
															4,
															4
														],
														"totalFrames": 16,
														"startTime": 0,
														"loop": true
													}
												},
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.54,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/FlareNoise.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.9803921568627451,
															0.9686274509803922
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0,
														"maxAlpha": 1,
														"frequency": 3
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.9361019461765823,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 2.200021846869432,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.8918696422213772,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.1557895429142269,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitterElec",
									"props": {
										"alignMode": "Screen",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.25,
										"spriteSheet": "Fx/Alphas/T_ElectricStar_4x4.png",
										"lifeTime": 0.5,
										"warmUpTime": -2,
										"emitRate": 3,
										"maxCount": 5,
										"instScale": 1.75
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
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
													0.984313725490196,
													0.803921568627451,
													0.6941176470588235
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.58,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.4658385093167702,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0.1956521739130435,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.38198757763975155,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5419254658385093,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.7981366459627329,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
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
			]
		},
		{
			"type": "constraint",
			"name": "constraint",
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
		}
	]
}