{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 75,
			"scaleY": 100,
			"scaleZ": 75,
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
			"name": "FXRoot",
			"scaleX": 1.5,
			"scaleY": 1.5,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "object",
					"name": "Rabban",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Harkonnen/Unit/Rabban/Male01_HarkonnenRabban.fbx",
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Rabban/Anim_Male01_Rabban_Skill.fbx"
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"enabled": false,
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.3,
										"scale": 1,
										"power": 2,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"enabled": false,
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.21,
										"scale": 0.31,
										"power": 1,
										"color": [
											1,
											1,
											1
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Human_Rabban_Skill_AOE",
					"source": "Fx/Unit/SkillsHeroes/FX_Human_Rabban_Skill_AOE.fx",
					"editorOnly": true,
					"scaleX": 0.33,
					"scaleY": 0.33,
					"scaleZ": 0.33
				},
				{
					"type": "object",
					"name": "FlashDecals",
					"enabled": false,
					"x": 0.94285,
					"y": 0.0389,
					"z": 1.08483,
					"scaleY": 0.9999999999999997,
					"scaleZ": 1.0000000000000002,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Black",
							"scaleX": 4,
							"scaleY": 3,
							"scaleZ": 1.5,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7283759563415447,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7543459073273315,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7961318592570372,
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
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"enabled": false,
									"keys": [
										{
											"time": 0.6712585499316005,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6812585499316005,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.8372093023255813,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.8472093023255813,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Red",
							"z": 0.12558,
							"scaleX": 4,
							"scaleY": 3,
							"scaleZ": 2,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
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
											"keys": [
												{
													"time": 0.75957316446691,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7914207740512219,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1524965777246625,
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
											1,
											0.09411764705882353,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.776668465205372,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9984714113053579,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.6882262235233838,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6982262235233838,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2451781126564874,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2551781126564874,
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
					"type": "object",
					"name": "CombatDrug",
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"children": [
						{
							"type": "object",
							"name": "Floor",
							"children": [
								{
									"type": "model",
									"name": "Spiral",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"enabled": false,
									"z": 1,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 7.71,
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
													"textureWrap": true
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
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
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													0.7215686274509804,
													0.11764705882352941,
													0
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors_details_add",
									"scaleX": 18,
									"scaleY": 18,
									"scaleZ": 2,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": true,
												"scale": 0.01,
												"rotation": 0
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
												"progress": 0.2,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.03,
													0.025
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.17,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.75,
												"uvScaleY": 0.75,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.03,
													-0.025
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
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.6509803921568628,
													0.07058823529411765,
													0.07058823529411765
												],
												"pointA": 0,
												"colorB": [
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												],
												"pointB": 0.38
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 400,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "DotsFloor",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 2,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 8,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
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
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png"
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
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												]
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
												"progress": 0.64,
												"saturation": 0,
												"width": 0.15,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.025,
													null
												]
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
												"progress": 0.26,
												"saturation": 0,
												"width": 0.52,
												"uvScaleX": 8,
												"uvScaleY": 8,
												"texture": "Fx/noise/FlareNoise.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.01,
													null
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.64
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.9211963141333409,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.639404037599789,
											"value": 1,
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
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.75,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 1,
							"keys": [
								{
									"time": 0.6912237516342756,
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
									"time": 1.1087655782837351,
									"value": 1,
									"prevHandle": {
										"dv": -0.005108173076922684,
										"dt": -0.2879242913626796
									},
									"nextHandle": {
										"dv": 0.005108173076922684,
										"dt": 0.2879242913626796
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "DecalsAoE",
					"x": 0.225,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_FlashInside",
							"enabled": false,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 2.15,
							"albedoMap": "Fx/Gradients/circGrad3.jpg",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.25
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7756588172847083,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7856588172847083,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.347788636697869,
													"value": 0,
													"prevHandle": {
														"dv": 0.01722222222222225,
														"dt": -0.37632122064209295
													},
													"nextHandle": {
														"dv": -0.018046172041527805,
														"dt": 0.40078962239515425
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
											0.9921568627450981,
											0.21568627450980393,
											0.08627450980392157
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7680288461538463,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.1985576923076924,
													"value": 1,
													"prevHandle": {
														"dv": -0.0050200154958675025,
														"dt": -0.3964543269230769
													},
													"nextHandle": {
														"dv": -5.920813037200014e-16,
														"dt": 0.5
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.6235294117647059,
											0.5686274509803921
										]
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.6097249191418559,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6197249191418559,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4916880621763087,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5016880621763082,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Duration",
							"x": -0.136547878787879,
							"y": -0.008169454545454535,
							"z": 0.12393084848484842,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_inside",
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4000000000000004,
									"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keys": [
														{
															"time": 0.7377335547314627,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4144890177266787,
															"value": 0.5,
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
													0.21568627450980393,
													0.08627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.78,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle4.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.5759665328889119,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5859665328889119,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_border",
									"enabled": false,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 6,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
									"renderMode": "BeforeTonemapping",
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
													"keys": [
														{
															"time": 0.7377335547314627,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4144890177266787,
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
													0.9882352941176471,
													0.19607843137254902,
													0.06274509803921569
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 0.31,
												"MULTIPLY": false,
												"color": [
													0.9882352941176471,
													0.2980392156862745,
													0.13725490196078433,
													1
												],
												"mask": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
												"UVOffset": [
													0,
													0
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
												"envBlend": 0.75,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.39244425538287797,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.402444255382878,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_glow",
									"enabled": false,
									"scaleX": 24,
									"scaleY": 24,
									"scaleZ": 6,
									"albedoMap": "Fx/Alphas/glow (129).png",
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keys": [
														{
															"time": 0.7377335547314627,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9977597657872552,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4144890177266787,
															"value": 0.5,
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
													0.21568627450980393,
													0.08627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.5759665328889119,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5859665328889119,
													"value": 1,
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
					"name": "Explosion",
					"x": 1.9304,
					"y": -0.01244,
					"children": [
						{
							"type": "object",
							"name": "FlareFloor",
							"enabled": false,
							"x": -0.18515000000000015,
							"y": -0.04644,
							"z": 0.31545,
							"scaleX": 1.6,
							"scaleY": 1.6,
							"scaleZ": 1.6,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_FlareBlack",
									"props": {
										"lifeTime": 0.35,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instStretch": [
											12,
											5,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitType": "Burst",
										"warmUpTime": -0.75,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
													}
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
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.45,
										"instStretch": [
											20,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"warmUpTime": -0.8,
										"emitType": "Burst",
										"instScale": 0.75,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"emissive": 6,
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	"prevHandle": {
																		"dv": 0.06196351517869349,
																		"dt": -0.49990757001492336
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.13446288206139395
																	}
																},
																{
																	"time": 0.18100772585187647,
																	"value": 1,
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Flarescreen",
									"enabled": false,
									"props": {
										"emitType": "Burst",
										"instScale": 6,
										"lifeTime": 0.2,
										"warmUpTime": -0.8,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 122.73,
									"rotationY": 54.55,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 1
													},
													"isInstance": true
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																	"mode": 2
																},
																{
																	"time": 0.337436981201172,
																	"value": 1,
																	"prevHandle": {
																		"dv": -1.1333333333333333,
																		"dt": -0.050000000000000044
																	},
																	"nextHandle": {
																		"dv": 0.6141901939981789,
																		"dt": 0.029366779035477106
																	}
																},
																{
																	"time": 1.0041889953613283,
																	"value": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -151464545
															},
															{
																"position": 0.828125,
																"color": -1
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -335603712
															},
															{
																"position": 0.73046875,
																"color": -536882500
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 2,
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
													"value": 0.25,
													"prevHandle": {
														"dv": 0.013591254720655976,
														"dt": -0.6969167042896149
													},
													"nextHandle": {
														"dv": -0.013591254720655976,
														"dt": 0.6969167042896149
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
							"name": "Impact",
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "emitter",
									"name": "SandProjectionMesh",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instStretch": [
											2,
											2,
											4
										],
										"lifeTime": 0.45,
										"lifeTimeRand": 0.1,
										"warmUpTime": -0.78,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.3
										],
										"instScale": 9,
										"instScale_rand": 0.1,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											360
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 45,
									"children": [
										{
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
											"rotationX": 90,
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
															"emissive": 5
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 4,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_HitBloodShape09_Spec.png"
													}
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
														"uvScaleX": 5,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.9964190873914609,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
														"progress": 1,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 4,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_HitBloodShape09_Dissolve.png",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": -0.011759534411960204,
																		"dt": 0.4632929664973744
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
														"progress": 0.31,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 4,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_HitBloodShape07_Dissolve.png",
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
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": -0.011759534411960204,
																		"dt": 0.4632929664973744
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"value": 0.3136958552692092,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
														"color": -65536
													},
													{
														"position": 0,
														"color": -187614
													},
													{
														"position": 0.984375,
														"color": -31145
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "model",
									"name": "Knee",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.58873,
									"y": -0.04672,
									"z": 2.37004,
									"scaleX": 0.4,
									"scaleY": 0.53,
									"scaleZ": 1.6,
									"rotationX": 2.9,
									"rotationY": 157.9,
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
													"emissive": 2
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 3.56,
												"uScale": 1,
												"vScale": 1,
												"uOffset": -0.18,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.26394348849104254,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6562558666490266,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8156719903889732,
															"value": 2,
															"mode": 2
														},
														{
															"time": 0.9485187601722627,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.4,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 0.28,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.53,
												"scaleY": 1,
												"shiftX": 1,
												"shiftY": 1,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6429711896706983,
															"value": 0.06666666666666667,
															"prevHandle": {
																"dv": -0.808452083454443,
																"dt": -0.48507125007266594
															},
															"nextHandle": {
																"dv": 0.13333333333333336,
																"dt": 0.08000000000000007
															}
														},
														{
															"time": 0.8057687905351487,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1143117439853443,
															"value": 1.3
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
												"useScale": true,
												"wrap": true,
												"progress": 0.79,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/T_Square03.jpg",
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
													"name": "width",
													"keys": [
														{
															"time": 0.8355990058564668,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.141146576358032,
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
												"range": 15.15,
												"power": 20
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.98,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/uGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
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
													0.1843137254901961,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.1498187855981161,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.2298187855981162,
															"value": 0.2,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Hit",
									"props": {
										"emitType": "Burst",
										"instScale_rand": 0,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"warmUpTime": 0.2,
										"lifeTime": 1.5,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"y": 1.1832913578315407e-33,
									"z": 0.1,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": -8.827812596100317e-31,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 7,
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
															"emissive": 15,
															"drawOrder": "120"
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
														"texture": "Fx/Alphas/T_FlatImpact02.png"
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
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/clouds.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.61,
																	"value": 0.01416666666666666,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.3775126578654911,
																		"dt": -0.49657530216143814
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 0.7050000000000001,
																	"value": 0.9419580650329591,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.8723667347431184,
																		"dt": 0.07999999999999996
																	}
																},
																{
																	"time": 0.95,
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
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.5,
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
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.03236093441864362,
														"dt": -0.49997643676805403
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.5149999999999999
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
								}
							]
						},
						{
							"type": "object",
							"name": "Smoke",
							"x": -0.49014000000000024,
							"z": 0.14999999999999997,
							"children": [
								{
									"type": "object",
									"name": "Smoke",
									"x": 0.49014,
									"z": -0.14999999999999994,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.4,
									"children": [
										{
											"type": "object",
											"name": "SmokeCloud",
											"z": 0.1499999999999997,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationZ": 180,
											"children": [
												{
													"type": "emitter",
													"name": "Dust_R",
													"props": {
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 5,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-3,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2.25,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 2.5,
													"scaleY": 2.5,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"progress": 1,
																		"saturation": 1,
																		"width": 0.6,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.5810434746209531,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 5,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-3,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2.25,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 2.5,
													"scaleY": 2.5,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.5810434746209531,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9882352941176471,
													0.3686274509803922,
													0.22352941176470587
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "FloorFireMesh05_ok",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"x": -0.2450699999999999,
									"z": 0.5,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.4,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.2
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.64
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.7230519651333083,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.04603681650857246
															}
														},
														{
															"time": 0.8611624146590257,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2930560946269278,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4592833410824406
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4592833410824406
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
													"time": 0.7230519651333083,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.12240557434238437
													}
												},
												{
													"time": 1.090268688160462,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.34626292011270465
													},
													"nextHandle": {
														"dv": -6.714071906065832e-16,
														"dt": 0.4592833410824406
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.6509803921568628,
													0.07058823529411765,
													0.07058823529411765
												],
												"pointA": 0,
												"colorB": [
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												],
												"pointB": 0.38
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.5,
												"power": 0.8
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
					"name": "emitter_BubblesFloor",
					"props": {
						"lifeTime": 3,
						"maxCount": 15,
						"instScale_rand": 0.5,
						"useRandomColor": true,
						"randomColor1": [
							0.6,
							0.6,
							0.6,
							1
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"lifeTimeRand": 1,
						"warmUpTime": -0.8,
						"randomGradient": {
							"stops": [
								{
									"position": 0,
									"color": -16777216
								},
								{
									"position": 1,
									"color": -1
								}
							],
							"resolution": 64,
							"isVertical": false,
							"interpolation": "Linear",
							"colorMode": 0
						}
					},
					"z": 0.2,
					"scaleX": 35,
					"scaleY": 35,
					"scaleZ": 0.02,
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
											"emissive": 2
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
										"alpha": 5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SphereInvert01.png"
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
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.37324346623743554
													},
													"nextHandle": {
														"dv": 0.029728712364460327,
														"dt": 0.33330480980464305
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
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.88,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.025,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											null
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
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.02423737262951664,
														"dt": -0.29927840945800255
													},
													"nextHandle": {
														"dv": 0.02423737262951664,
														"dt": 0.29927840945800255
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
									"enabled": false,
									"props": {
										"amount": 0.75,
										"color": [
											0.9254901960784314,
											0.18823529411764706,
											0.09803921568627451
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
										"envBlend": 0.75,
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
									"time": 0,
									"value": 0,
									"prevHandle": {
										"dv": -1.4086259259711857,
										"dt": -0.4901377207616426
									},
									"nextHandle": {
										"dv": 0.8333333333333334,
										"dt": 0.28996207801094903
									}
								},
								{
									"time": 1,
									"value": 1,
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
					"type": "shader",
					"name": "NightEmissive",
					"source": "shaders/NightEmissive.hx",
					"props": {
						"amount": 0.7,
						"ATTENUATE": true,
						"emissiveMap": null
					}
				}
			]
		},
		{
			"type": "object",
			"name": "backup",
			"enabled": false,
			"scaleX": 1.5,
			"scaleY": 1.5,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "object",
					"name": "Rabban",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Harkonnen/Unit/Rabban/Male01_HarkonnenRabban.fbx",
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Rabban/Anim_Male01_Rabban_Skill.fbx"
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"enabled": false,
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.3,
										"scale": 1,
										"power": 2,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"enabled": false,
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.21,
										"scale": 0.31,
										"power": 1,
										"color": [
											1,
											1,
											1
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Hand",
					"enabled": false,
					"children": [
						{
							"type": "model",
							"name": "Sphere",
							"source": "Fx/Meshes_Common/Sphere.fbx",
							"x": -0.16662,
							"y": -0.09725,
							"z": 0.0564,
							"scaleX": 0.22,
							"scaleY": 0.22,
							"scaleZ": 0.22,
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
											"emissive": 10
										}
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.0710624177752346,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.0810624177752346,
											"value": 0,
											"mode": 2
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
											0.09411764705882353,
											0
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Flares",
							"x": -0.12689,
							"y": -0.17294,
							"z": 0.11708,
							"children": [
								{
									"type": "emitter",
									"name": "Flarescreen",
									"enabled": false,
									"props": {
										"emitType": "Burst",
										"alignMode": "Screen",
										"instScale": 2,
										"lifeTime": 0.5,
										"warmUpTime": -0.55,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.09000000000000002,
									"scaleY": 0.09000000000000004,
									"scaleZ": 0.09000000000000002,
									"rotationY": -1.6565388965955813e-15,
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
															"enableStencil": false,
															"parallax": 0
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 1
													},
													"isInstance": true
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																	"mode": 2
																},
																{
																	"time": 0.337436981201172,
																	"value": 1,
																	"prevHandle": {
																		"dv": -1.1333333333333333,
																		"dt": -0.050000000000000044
																	},
																	"nextHandle": {
																		"dv": 0.6141901939981789,
																		"dt": 0.029366779035477106
																	}
																},
																{
																	"time": 1.0041889953613283,
																	"value": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -151464545
															},
															{
																"position": 0.828125,
																"color": -1
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								},
								{
									"type": "object",
									"name": "flare",
									"scaleX": 0.6,
									"scaleY": 0.6,
									"scaleZ": 0.6,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_FlareBlack",
											"props": {
												"lifeTime": 0.7,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.5,
												"instStretch": [
													15,
													8,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"emitType": "Burst",
												"warmUpTime": -0.4,
												"instScale": 0.75,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1.25,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare06_512.png"
															}
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
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.4,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													12,
													4,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"warmUpTime": -0.45,
												"emitType": "Burst",
												"instScale": 0.75,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"emissive": 6,
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare06_512.png"
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
																			"prevHandle": {
																				"dv": 0.06196351517869349,
																				"dt": -0.49990757001492336
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.13446288206139395
																			}
																		},
																		{
																			"time": 0.18100772585187647,
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
																"amount": 1,
																"color": [
																	1,
																	0.09411764705882353,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"enabled": false,
																	"keys": [
																		{
																			"time": 0.18627485348007422,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.24040626092586503,
																			"value": 1,
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
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Flarescreen",
											"props": {
												"emitType": "Burst",
												"alignMode": "Screen",
												"instScale": 5,
												"lifeTime": 0.4,
												"warmUpTime": -0.4,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
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
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 15,
																"power": 1
															},
															"isInstance": true
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
																"alpha": 0.7,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle2.png"
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
																			"mode": 2
																		},
																		{
																			"time": 0.337436981201172,
																			"value": 1,
																			"prevHandle": {
																				"dv": -1.1333333333333333,
																				"dt": -0.050000000000000044
																			},
																			"nextHandle": {
																				"dv": 0.6141901939981789,
																				"dt": 0.029366779035477106
																			}
																		},
																		{
																			"time": 1.0041889953613283,
																			"value": 0
																		}
																	]
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -151464545
																	},
																	{
																		"position": 0.828125,
																		"color": -1
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"enabled": false,
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -335603712
																	},
																	{
																		"position": 0.73046875,
																		"color": -536882500
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 1,
														"ATTENUATE": true,
														"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
													}
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.013591254720655976,
																"dt": -0.6969167042896149
															},
															"nextHandle": {
																"dv": -0.013591254720655976,
																"dt": 0.6969167042896149
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"enabled": false,
											"x": -0.15407000000000015,
											"y": -0.026340000000000252,
											"z": -0.011750000000000038,
											"scaleX": 3.2,
											"scaleY": 1.28,
											"scaleZ": 1.02,
											"rotationX": -86.19999999999999,
											"rotationY": -4.299999999999999,
											"rotationZ": 9.699999999999992,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.40085874877591676,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.41085874877591677,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.48888888888888915,
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
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_White",
											"enabled": false,
											"x": 0.38412,
											"y": 0.33212,
											"z": -0.22859,
											"scaleX": 2,
											"scaleY": 1.28,
											"scaleZ": 1.02,
											"rotationX": -82.9,
											"rotationY": 20.7,
											"rotationZ": 19.9,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.9
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.4815002275436586,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5133478371279705,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.191726442236466,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0002777777777778212,
																		"dt": -0.3404932692104188
																	},
																	"nextHandle": {
																		"dv": -3.169117678723169e-16,
																		"dt": 0.33333745332369774
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
															0.09411764705882353,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.5346476630012014,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5921496647810678,
																	"value": 1,
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
									"name": "flare2",
									"enabled": false,
									"x": -0.10781,
									"y": 0.21723,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_FlareBlack",
											"props": {
												"lifeTime": 0.35,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.5,
												"instStretch": [
													15,
													8,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"emitType": "Burst",
												"warmUpTime": -0.75,
												"instScale": 1.1,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1.25,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare06_512.png"
															}
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
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													20,
													4,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"warmUpTime": -0.8,
												"emitType": "Burst",
												"instScale": 0.75,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"emissive": 6,
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare06_512.png"
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
																			"prevHandle": {
																				"dv": 0.06196351517869349,
																				"dt": -0.49990757001492336
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.13446288206139395
																			}
																		},
																		{
																			"time": 0.18100772585187647,
																			"value": 1,
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
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Flarescreen",
											"enabled": false,
											"props": {
												"emitType": "Burst",
												"instScale": 6,
												"lifeTime": 0.2,
												"warmUpTime": -0.8,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
														},
														{
															"position": 1,
															"color": -1
														}
													],
													"resolution": 64,
													"isVertical": false,
													"interpolation": "Linear",
													"colorMode": 0
												}
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 122.73,
											"rotationY": 54.55,
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
																	"enableStencil": false,
																	"parallax": 0,
																	"emissive": 1
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 5,
																"power": 1
															},
															"isInstance": true
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
																"alpha": 0.7,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle2.png"
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
																			"mode": 2
																		},
																		{
																			"time": 0.337436981201172,
																			"value": 1,
																			"prevHandle": {
																				"dv": -1.1333333333333333,
																				"dt": -0.050000000000000044
																			},
																			"nextHandle": {
																				"dv": 0.6141901939981789,
																				"dt": 0.029366779035477106
																			}
																		},
																		{
																			"time": 1.0041889953613283,
																			"value": 0
																		}
																	]
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"enabled": false,
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -151464545
																	},
																	{
																		"position": 0.828125,
																		"color": -1
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -335603712
																	},
																	{
																		"position": 0.73046875,
																		"color": -536882500
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 1,
														"ATTENUATE": true,
														"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
													}
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 2,
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
															"value": 0.25,
															"prevHandle": {
																"dv": 0.013591254720655976,
																"dt": -0.6969167042896149
															},
															"nextHandle": {
																"dv": -0.013591254720655976,
																"dt": 0.6969167042896149
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
					"name": "FlashDecals",
					"enabled": false,
					"x": 0.86789,
					"y": -0.03808,
					"z": 1.01449,
					"scaleY": 0.9999999999999997,
					"scaleZ": 1.0000000000000002,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Black",
							"scaleX": 4,
							"scaleY": 3,
							"scaleZ": 1.5,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7389670972606734,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7589656279806607,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8007515799103664,
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
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.6712585499316005,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6812585499316005,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.8372093023255813,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.8472093023255813,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Red",
							"z": 0.12558,
							"scaleX": 4,
							"scaleY": 3,
							"scaleZ": 2,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
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
											"keys": [
												{
													"time": 0.7990588543583199,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8309064639426318,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1919822676160732,
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
											1,
											0.09411764705882353,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.8161541550967819,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0379571011967685,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.7277119134147937,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7377119134147937,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.284663802547898,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.294663802547898,
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
					"type": "object",
					"name": "Passsif",
					"enabled": false,
					"children": [
						{
							"type": "object",
							"name": "FlashDecals",
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"scaleX": 3,
									"scaleY": 3,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 1.430664836497738,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4506633672177252,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4924493191474308,
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
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Red",
									"scaleX": 3.5,
									"scaleY": 3,
									"scaleZ": 1.75,
									"rotationY": -18,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 0.5,
									"emissive": 2,
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
													"keys": [
														{
															"time": 1.4907565935953844,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5226042031796962,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.399096258206216,
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
													1,
													0.09411764705882353,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.5078518943338464,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9349625456623294,
															"value": 1,
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
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Hand",
					"target": "FXAnimation.FXRoot.Rabban.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Passsif",
					"target": "FXAnimation.FXRoot.Rabban.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J"
				},
				{
					"type": "object",
					"name": "DecalsAoE",
					"x": -0.004601111111111167,
					"z": -0.17653444444444444,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_FlashInside",
							"enabled": false,
							"x": 0.004601111111111056,
							"y": 6.938893903907228e-18,
							"z": 0.17653444444444444,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 2.13,
							"albedoMap": "Fx/Gradients/circGrad3.jpg",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
													"time": 1.4907061612151202,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5007061612151202,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.062835980628281,
													"value": 0,
													"prevHandle": {
														"dv": 0.01722222222222225,
														"dt": -0.37632122064209295
													},
													"nextHandle": {
														"dv": -0.018046172041527805,
														"dt": 0.40078962239515425
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
											0.9921568627450981,
											0.21568627450980393,
											0.08627450980392157
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.3247722630722678,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3347722630722678,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.206735406106721,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.2167354061067206,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Duration",
							"x": -0.136547878787879,
							"y": -0.008169454545454535,
							"z": 0.12393084848484842,
							"children": [
								{
									"type": "object",
									"name": "Ribbon",
									"children": [
										{
											"type": "polygon",
											"name": "Ribbon",
											"z": 0.25,
											"scaleX": 10.6,
											"scaleY": 10.6,
											"kind": 1,
											"args": [
												48,
												360,
												0.67,
												4
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 6,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_05.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.21568627450980393,
															0.08627450980392157
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
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
														"progress": 0.75,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 4,
														"uvScaleY": 0.1,
														"texture": "Fx/Gradients/Cyl05v_A01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.1,
															0
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
														"progress": 0.23,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														],
														"tag": "LifeTiming"
													}
												},
												{
													"type": "shader",
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 7,
														"texScaleY": 7,
														"tex": "Fx/Gradients/Cyl05v_A01.png",
														"intensity": 2,
														"scrollSpeed": [
															0.5,
															0
														]
													}
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
												"power": 0.8
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
													"keys": [
														{
															"time": 1.5787261849952332,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8387523960510257,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2554816479904494,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_inside",
									"x": 0.14114898989899016,
									"y": 0.008169454545454542,
									"z": 0.05260359595959607,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4000000000000004,
									"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keys": [
														{
															"time": 1.4527808986618747,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7128071097176671,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 2.129536361657091,
															"value": 0.5,
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
													0.21568627450980393,
													0.08627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.78,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle4.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.2910138768193238,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3010138768193238,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_border",
									"x": 0.1365478787878791,
									"y": 0.008169454545454542,
									"z": 0.0525991515151516,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 6,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
									"renderMode": "BeforeTonemapping",
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
													"enabled": false,
													"keys": [
														{
															"time": 1.2543688383340321,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5143950493898246,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9311243013292485,
															"value": 0.5,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 1.4527808986618747,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7128071097176671,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.129536361657091,
															"value": 0.5,
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
													0.9882352941176471,
													0.19607843137254902,
													0.06274509803921569
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 0.31,
												"MULTIPLY": false,
												"color": [
													0.9882352941176471,
													0.2980392156862745,
													0.13725490196078433,
													1
												],
												"mask": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
												"UVOffset": [
													0,
													0
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
												"envBlend": 0.75,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.1074915993132899,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.11749159931329,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_glow",
									"x": 0.14114898989899016,
									"y": 0.008169454545454542,
									"z": 0.05260359595959607,
									"scaleX": 24,
									"scaleY": 24,
									"scaleZ": 6,
									"albedoMap": "Fx/Alphas/glow (129).png",
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keys": [
														{
															"time": 1.4527808986618747,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7128071097176671,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 2.129536361657091,
															"value": 0.5,
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
													0.21568627450980393,
													0.08627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 1.2910138768193238,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3010138768193238,
													"value": 1,
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
					"name": "CombatDrug",
					"scaleX": 1.25,
					"scaleY": 1.25,
					"scaleZ": 1.25,
					"children": [
						{
							"type": "object",
							"name": "Floor",
							"children": [
								{
									"type": "model",
									"name": "Spiral",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"z": 1,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 7.71,
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
													"textureWrap": true
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
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
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													0.7215686274509804,
													0.11764705882352941,
													0
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors_details_add",
									"scaleX": 18,
									"scaleY": 18,
									"scaleZ": 9,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": true,
												"scale": 0.016,
												"rotation": 0
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
												"progress": 0.2,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.03,
													0.025
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.17,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.75,
												"uvScaleY": 0.75,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.03,
													-0.025
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
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.6509803921568628,
													0.07058823529411765,
													0.07058823529411765
												],
												"pointA": 0,
												"colorB": [
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												],
												"pointB": 0.38
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 400,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"enabled": false,
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.7701100864839976,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8644463120498349,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3493796090534025,
															"value": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "DotsFloor",
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 6,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 8,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
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
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png"
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
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												]
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
												"progress": 0.64,
												"saturation": 0,
												"width": 0.15,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.025,
													null
												]
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
												"progress": 0.26,
												"saturation": 0,
												"width": 0.52,
												"uvScaleX": 9,
												"uvScaleY": 9,
												"texture": "Fx/noise/FlareNoise.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.01,
													null
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.64
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keys": [
										{
											"time": 0.7701100864839976,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8644463120498349,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3493796090534025,
											"value": 0
										},
										{
											"time": 1.442315109744114,
											"value": 0
										},
										{
											"time": 2.546587615641951,
											"value": 1
										}
									]
								},
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"prevHandle": {
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 1.442315109744114,
											"value": 0
										},
										{
											"time": 2.546587615641951,
											"value": 1
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
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.75,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 1,
							"keys": [
								{
									"time": 0.6912237516342756,
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
									"time": 1.1087655782837351,
									"value": 1,
									"prevHandle": {
										"dv": -0.005108173076922684,
										"dt": -0.2879242913626796
									},
									"nextHandle": {
										"dv": 0.005108173076922684,
										"dt": 0.2879242913626796
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Explosion",
					"x": 1.9304,
					"y": -0.01244,
					"children": [
						{
							"type": "object",
							"name": "FlareFloor",
							"enabled": false,
							"x": -0.18515000000000015,
							"y": -0.04644,
							"z": 0.31545,
							"scaleX": 1.6,
							"scaleY": 1.6,
							"scaleZ": 1.6,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_FlareBlack",
									"props": {
										"lifeTime": 0.35,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instStretch": [
											12,
											5,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitType": "Burst",
										"warmUpTime": -0.75,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
													}
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
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.45,
										"instStretch": [
											20,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"warmUpTime": -0.8,
										"emitType": "Burst",
										"instScale": 0.75,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 45,
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
															"emissive": 6,
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	"prevHandle": {
																		"dv": 0.06196351517869349,
																		"dt": -0.49990757001492336
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.13446288206139395
																	}
																},
																{
																	"time": 0.18100772585187647,
																	"value": 1,
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.2334981930436706,
														"dt": -0.4276798037244547
													},
													"nextHandle": {
														"dv": -0.7166666666666667,
														"dt": 0.24848342791614272
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5240317437099238
													},
													"nextHandle": {
														"dv": -3.8880269028916045e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Flarescreen",
									"enabled": false,
									"props": {
										"emitType": "Burst",
										"instScale": 6,
										"lifeTime": 0.2,
										"warmUpTime": -0.8,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 122.73,
									"rotationY": 54.55,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 1
													},
													"isInstance": true
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																	"mode": 2
																},
																{
																	"time": 0.337436981201172,
																	"value": 1,
																	"prevHandle": {
																		"dv": -1.1333333333333333,
																		"dt": -0.050000000000000044
																	},
																	"nextHandle": {
																		"dv": 0.6141901939981789,
																		"dt": 0.029366779035477106
																	}
																},
																{
																	"time": 1.0041889953613283,
																	"value": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -151464545
															},
															{
																"position": 0.828125,
																"color": -1
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -335603712
															},
															{
																"position": 0.73046875,
																"color": -536882500
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 2,
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
													"value": 0.25,
													"prevHandle": {
														"dv": 0.013591254720655976,
														"dt": -0.6969167042896149
													},
													"nextHandle": {
														"dv": -0.013591254720655976,
														"dt": 0.6969167042896149
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
							"name": "Impact",
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "emitter",
									"name": "SandProjectionMesh",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instStretch": [
											2,
											2,
											4
										],
										"lifeTime": 0.45,
										"lifeTimeRand": 0.1,
										"warmUpTime": -0.78,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.3
										],
										"instScale": 9,
										"instScale_rand": 0.1,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											360
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 45,
									"children": [
										{
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
											"rotationX": 90,
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
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 4,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_HitBloodShape09_Spec.png"
													}
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
														"uvScaleX": 5,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.9964190873914609,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/clouds.png",
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
													"isInstance": true,
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
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
														"progress": 1,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 4,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_HitBloodShape09_Dissolve.png",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": -0.011759534411960204,
																		"dt": 0.4632929664973744
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
														"progress": 0.31,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 4,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_HitBloodShape07_Dissolve.png",
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
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": -0.011759534411960204,
																		"dt": 0.4632929664973744
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"value": 0.3136958552692092,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
														"color": -65536
													},
													{
														"position": 0,
														"color": -187614
													},
													{
														"position": 0.984375,
														"color": -31145
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "model",
									"name": "Knee",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.58873,
									"y": -0.04672,
									"z": 2.37004,
									"scaleX": 0.4,
									"scaleY": 0.53,
									"scaleZ": 1.6,
									"rotationX": 2.9,
									"rotationY": 157.9,
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 3.56,
												"uScale": 1,
												"vScale": 1,
												"uOffset": -0.18,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.26394348849104254,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6562558666490266,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8156719903889732,
															"value": 2,
															"mode": 2
														},
														{
															"time": 0.9485187601722627,
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
													0.5098039215686274,
													0.8117647058823529,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.2719176486763093,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2111137216652725,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.4,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 0.28,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.53,
												"scaleY": 1,
												"shiftX": 1,
												"shiftY": 1,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6429711896706983,
															"value": 0.06666666666666667,
															"prevHandle": {
																"dv": -0.808452083454443,
																"dt": -0.48507125007266594
															},
															"nextHandle": {
																"dv": 0.13333333333333336,
																"dt": 0.08000000000000007
															}
														},
														{
															"time": 0.8057687905351487,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1143117439853443,
															"value": 1.3
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
												"useScale": true,
												"wrap": true,
												"progress": 0.79,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/T_Square03.jpg",
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
													"name": "width",
													"keys": [
														{
															"time": 0.8355990058564668,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.141146576358032,
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
												"range": 15.15,
												"power": 20
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.98,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/uGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
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
													0.1843137254901961,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.1498187855981161,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.2298187855981162,
															"value": 0.2,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Hit",
									"enabled": false,
									"props": {
										"emitType": "Burst",
										"instScale_rand": 0,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"warmUpTime": 0.2,
										"lifeTime": 1.5,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"y": 1.1832913578315407e-33,
									"z": 0.1,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": -8.827812596100317e-31,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 7,
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
															"emissive": 10,
															"drawOrder": "120"
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
														"texture": "Fx/Alphas/T_FlatImpact02.png"
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
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/clouds.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.61,
																	"value": 0.01416666666666666,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.3775126578654911,
																		"dt": -0.49657530216143814
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 0.7050000000000001,
																	"value": 0.9419580650329591,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.8723667347431184,
																		"dt": 0.07999999999999996
																	}
																},
																{
																	"time": 0.95,
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
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.5,
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
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.03236093441864362,
														"dt": -0.49997643676805403
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.5149999999999999
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
								}
							]
						},
						{
							"type": "object",
							"name": "Smoke",
							"x": -0.49014000000000024,
							"z": 0.14999999999999997,
							"children": [
								{
									"type": "object",
									"name": "Smoke",
									"enabled": false,
									"x": 0.49014,
									"z": -0.14999999999999994,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.4,
									"children": [
										{
											"type": "object",
											"name": "SmokeCloud",
											"enabled": false,
											"z": 0.1499999999999997,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationZ": 180,
											"children": [
												{
													"type": "emitter",
													"name": "Dust_R",
													"props": {
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 4,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-5,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
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
																			"blend": "Add",
																			"shadows": false,
																			"culling": "None",
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"parallax": 0,
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"progress": 1,
																		"saturation": 1,
																		"width": 0.6,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.x",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": -1.3672657644404587,
																		"dt": 0.1787849395896004
																	}
																},
																{
																	"time": 0.9955925191903219,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.11353083973010732
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.11353083973010732
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
															"name": "instAcceleration.x",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.08774912838407467,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5537956821669789,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.10401561115628433
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10401561115628433
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
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 4,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-5,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
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
																			"blend": "Add",
																			"shadows": false,
																			"culling": "None",
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"parallax": 0,
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.x",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": -1.3672657644404587,
																		"dt": 0.1787849395896004
																	}
																},
																{
																	"time": 0.9955925191903219,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.11353083973010732
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.11353083973010732
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
															"name": "instAcceleration.x",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.08774912838407467,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5537956821669789,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.10401561115628433
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10401561115628433
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
											"name": "SmokeCloud",
											"z": 0.1499999999999997,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationZ": 180,
											"children": [
												{
													"type": "emitter",
													"name": "Dust_R",
													"props": {
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 4,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-3,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2.2,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"progress": 1,
																		"saturation": 1,
																		"width": 0.6,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.x",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": -1.3672657644404587,
																		"dt": 0.1787849395896004
																	}
																},
																{
																	"time": 0.9955925191903219,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.11353083973010732
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.11353083973010732
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
															"name": "instAcceleration.x",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.08774912838407467,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5537956821669789,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.10401561115628433
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10401561115628433
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
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 4,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-3,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2.2,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.x",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": -1.3672657644404587,
																		"dt": 0.1787849395896004
																	}
																},
																{
																	"time": 0.9955925191903219,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.11353083973010732
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.11353083973010732
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
															"name": "instAcceleration.x",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.08774912838407467,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5537956821669789,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.10401561115628433
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.10401561115628433
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
											"name": "SmokeCloud",
											"enabled": false,
											"z": 0.1499999999999997,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationZ": 180,
											"children": [
												{
													"type": "emitter",
													"name": "Dust_R",
													"props": {
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
														"instScale": 5,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															10,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															0,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 120,
														"warmUpTime": -1.4,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2.5,
														"speedFactor": 2,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.8
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.5,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instRotation.z",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
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
																	"value": -9,
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
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
														"instScale": 5,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															10,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															0,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 120,
														"warmUpTime": -1.4,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 2.5,
														"speedFactor": 2,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.8
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.5,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instRotation.z",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
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
																	"value": -9,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9882352941176471,
													0.3686274509803922,
													0.22352941176470587
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Smoke",
									"x": 0.49014,
									"z": -0.14999999999999994,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.4,
									"children": [
										{
											"type": "object",
											"name": "SmokeCloud",
											"z": 0.1499999999999997,
											"scaleX": 3.5,
											"scaleY": 3.5,
											"scaleZ": 3.5,
											"rotationZ": 180,
											"children": [
												{
													"type": "emitter",
													"name": "Dust_R",
													"props": {
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 4,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-3,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 1.75,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 2.5,
													"scaleY": 2.5,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"progress": 1,
																		"saturation": 1,
																		"width": 0.6,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.5810434746209531,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
														"instScale_rand": 0.5,
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
														"lifeTimeRand": 0.25,
														"emitSurface": true,
														"instSpeed_rand": [
															0.2,
															0,
															0
														],
														"alignMode": "Screen",
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_09_2.png",
														"instScale": 4,
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
														"burstParticleCount": 20,
														"emitOrientation": "Normal",
														"emitRad2": 0.89,
														"instSpeed": [
															15,
															0,
															0
														],
														"seedGroup": 2,
														"instAcceleration": [
															-3,
															0,
															0.25
														],
														"instAcceleration_rand": [
															0,
															0,
															0.05
														],
														"emitAngle": 140,
														"warmUpTime": -0.7,
														"emitDuration": 50,
														"burstDelay": 1.5,
														"lifeTime": 1.75,
														"randomGradient": {
															"stops": [
																{
																	"position": 0,
																	"color": -16777216
																},
																{
																	"position": 1,
																	"color": -1
																}
															],
															"resolution": 64,
															"isVertical": false,
															"interpolation": "Linear",
															"colorMode": 0
														}
													},
													"scaleX": 2.5,
													"scaleY": 2.5,
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
																			"textureWrap": true,
																			"drawOrder": "100"
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
																		"scale": 1
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.25
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
																					"prevHandle": {
																						"dv": -23.189889242182407,
																						"dt": -0.28977503660331055
																					},
																					"nextHandle": {
																						"dv": 1.1326797123854366,
																						"dt": 0.014304442805171833
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": 0.009064468553734106,
																						"dt": -0.12276957500670424
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 1,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -21.71788833045742,
																						"dt": -1.0703742298131396
																					},
																					"nextHandle": {
																						"dv": 0.9175302479731284,
																						"dt": 0.04485923833819242
																					}
																				},
																				{
																					"time": 0.13325949973049692,
																					"value": 0.9889393939393939,
																					"mode": 1,
																					"prevHandle": {
																						"dv": -0.05455370624347011,
																						"dt": -0.08412795297914331
																					},
																					"nextHandle": {
																						"dv": -0.05827345639241999,
																						"dt": 0.25322009210623775
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.05527291324696937,
																						"dt": -0.6747448979591837
																					},
																					"nextHandle": {
																						"dv": -0.05527291324696937,
																						"dt": 0.6747448979591837
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
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
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
																					"value": 0.75,
																					"prevHandle": {
																						"dv": 1.1116321015082125,
																						"dt": -0.3076091494743911
																					},
																					"nextHandle": {
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
																		"range": 3,
																		"power": 0.8
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
																			0.8156862745098039,
																			0.7764705882352941
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "MaskColorAlpha",
																	"source": "hrt.shader.MaskColorAlpha",
																	"props": {
																		"UVScale": [
																			0.5,
																			0.5
																		],
																		"alpha": 0.5,
																		"MULTIPLY": true,
																		"color": [
																			0.6549019607843137,
																			0.615686274509804,
																			0.5686274509803921,
																			1
																		],
																		"mask": "Fx/noise/Water_03.png",
																		"UVOffset": [
																			0,
																			0
																		]
																	}
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.72,
																	"topSpan": 0.35,
																	"dirIntensity": 0.22,
																	"dirSpan": 0.76,
																	"sandBlend": 0.2,
																	"envBlend": 0.5,
																	"children": [
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": 1.951642717035785e-16,
																						"dt": -0.5000466393279532
																					},
																					"nextHandle": {
																						"dv": 0,
																						"dt": 0.7466729480869408
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.8703703703703703,
																						"dt": -0.1852286708685119
																					},
																					"nextHandle": {
																						"dv": 1.0073932782131654,
																						"dt": 0.21521484192810764
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "sandBlend",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0,
																					"prevHandle": {
																						"dv": -0.7185579310857965,
																						"dt": -0.43124811440283806
																					},
																					"nextHandle": {
																						"dv": 0.9033269751959244,
																						"dt": 0.5421386890181691
																					}
																				},
																				{
																					"time": 0.9987244897959183,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.029759915530303438,
																						"dt": -0.5272995428235974
																					},
																					"nextHandle": {
																						"dv": 0.029759915530303438,
																						"dt": 0.5272995428235974
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
															"name": "instSpeed.x",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 2.1023416614933987,
																		"dt": -0.4282297127150212
																	},
																	"nextHandle": {
																		"dv": -0.9323996936788761,
																		"dt": 0.18941763067061912
																	}
																},
																{
																	"time": 0.5810434746209531,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.008622874559739091,
																		"dt": -0.42348956251368763
																	},
																	"nextHandle": {
																		"dv": 0.010490100027312913,
																		"dt": 0.5819290529477377
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
																	"prevHandle": {
																		"dv": 3.1158193827784832,
																		"dt": -0.07764119888199704
																	},
																	"nextHandle": {
																		"dv": -0.97754863929894,
																		"dt": 0.024242297509352445
																	}
																},
																{
																	"time": 0.6549999999999999,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.02853471978328992,
																		"dt": -0.602201709020346
																	},
																	"nextHandle": {
																		"dv": 0.02853471978328992,
																		"dt": 0.602201709020346
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instScale",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.01248450392811181,
																		"dt": -0.098262780692611
																	},
																	"nextHandle": {
																		"dv": 0.3955237012855743,
																		"dt": 0.14027147110519406
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"prevHandle": {
																		"dv": -0.04662014920911317,
																		"dt": -0.72947644858284
																	},
																	"nextHandle": {
																		"dv": 0.04662014920911317,
																		"dt": 0.72947644858284
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
																	"value": -9,
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
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9882352941176471,
													0.3686274509803922,
													0.22352941176470587
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "FloorFireMesh05_ok",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"x": -0.2450699999999999,
									"z": 0.5,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.4,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.2
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.64
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6965013676225603,
															"value": 0
														},
														{
															"time": 0.8346118171482777,
															"value": 1
														},
														{
															"time": 1.2665054971161793,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4592833410824406
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4592833410824406
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
													"time": 0.6965013676225603,
													"value": 0
												},
												{
													"time": 1.0637180906497135,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.34626292011270465
													},
													"nextHandle": {
														"dv": -6.714071906065832e-16,
														"dt": 0.4592833410824406
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.6509803921568628,
													0.07058823529411765,
													0.07058823529411765
												],
												"pointA": 0,
												"colorB": [
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												],
												"pointB": 0.38
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "FloorFireMesh05",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"enabled": false,
									"z": 0.5,
									"scaleX": 9,
									"scaleY": 9,
									"scaleZ": 9,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.4,
												"uvScaleY": 0.3,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-1.5
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.47871017371490254,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.42764775518531295
															}
														},
														{
															"time": 1.1808184284967596,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.6818684103183577,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.0023910182595263674,
																"dt": -0.16950419671012962
															},
															"nextHandle": {
																"dv": -4.2839047805413515e-16,
																"dt": 0.6627252119324963
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.9630449844193507,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1279044119931949
															}
														},
														{
															"time": 1.2564727531096216,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.6853287227338636,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.0023910182595263674,
																"dt": -0.16950419671012962
															},
															"nextHandle": {
																"dv": -4.2839047805413515e-16,
																"dt": 0.6627252119324963
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.6509803921568628,
													0.07058823529411765,
													0.07058823529411765
												],
												"pointA": 0,
												"colorB": [
													0.9254901960784314,
													0.2549019607843137,
													0.09803921568627451
												],
												"pointB": 0.38
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
																"color": -5100757
															},
															{
																"position": 0.67578125,
																"color": -2536148
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.64
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8474959402714476,
															"value": 0
														},
														{
															"time": 0.985606389797165,
															"value": 1
														},
														{
															"time": 1.5819924218400354,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4592833410824406
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4592833410824406
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
												"range": 0.5,
												"power": 0.8
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
					"name": "emitter_BubblesFloor",
					"props": {
						"lifeTime": 3,
						"maxCount": 15,
						"instScale_rand": 0.5,
						"useRandomColor": true,
						"randomColor1": [
							0.6,
							0.6,
							0.6,
							1
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"lifeTimeRand": 1,
						"warmUpTime": -2,
						"randomGradient": {
							"stops": [
								{
									"position": 0,
									"color": -16777216
								},
								{
									"position": 1,
									"color": -1
								}
							],
							"resolution": 64,
							"isVertical": false,
							"interpolation": "Linear",
							"colorMode": 0
						}
					},
					"z": 0.2,
					"scaleX": 16,
					"scaleY": 16,
					"scaleZ": 0.01,
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
											"emissive": 2
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
										"alpha": 5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SphereInvert01.png"
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
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.37324346623743554
													},
													"nextHandle": {
														"dv": 0.029728712364460327,
														"dt": 0.33330480980464305
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
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.88,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.025,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											null
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
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.02423737262951664,
														"dt": -0.29927840945800255
													},
													"nextHandle": {
														"dv": 0.02423737262951664,
														"dt": 0.29927840945800255
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
									"enabled": false,
									"props": {
										"amount": 0.75,
										"color": [
											0.9254901960784314,
											0.18823529411764706,
											0.09803921568627451
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
										"envBlend": 0.75,
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
									"time": 0,
									"value": 0,
									"prevHandle": {
										"dv": -1.4086259259711857,
										"dt": -0.4901377207616426
									},
									"nextHandle": {
										"dv": 0.8333333333333334,
										"dt": 0.28996207801094903
									}
								},
								{
									"time": 1,
									"value": 1,
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
					"name": "emitter_Bubbles",
					"props": {
						"lifeTime": 3,
						"maxCount": 15,
						"instScale_rand": 0.5,
						"useRandomColor": true,
						"randomColor1": [
							0.6,
							0.6,
							0.6,
							1
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"lifeTimeRand": 1,
						"warmUpTime": -2,
						"seedGroup": 1,
						"alignMode": "Screen",
						"emitRate": 6,
						"instWorldSpeed": [
							0,
							0,
							5
						],
						"instWorldSpeed_rand": [
							0,
							0,
							2
						],
						"instScale": 0.8,
						"randomGradient": {
							"stops": [
								{
									"position": 0,
									"color": -16777216
								},
								{
									"position": 1,
									"color": -1
								}
							],
							"resolution": 64,
							"isVertical": false,
							"interpolation": "Linear",
							"colorMode": 0
						}
					},
					"z": 0.2,
					"scaleX": 15,
					"scaleY": 15,
					"scaleZ": 0.01,
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
											"emissive": 2
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
										"alpha": 5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SphereInvert01.png"
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
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.37324346623743554
													},
													"nextHandle": {
														"dv": 0.029728712364460327,
														"dt": 0.33330480980464305
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
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.88,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.025,
											null
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/circGrad01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											null
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
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.02423737262951664,
														"dt": -0.29927840945800255
													},
													"nextHandle": {
														"dv": 0.02423737262951664,
														"dt": 0.29927840945800255
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
									"enabled": false,
									"props": {
										"amount": 0.75,
										"color": [
											0.9254901960784314,
											0.18823529411764706,
											0.09803921568627451
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
										"envBlend": 0.75,
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
									"time": 0,
									"value": 0,
									"prevHandle": {
										"dv": -1.4086259259711857,
										"dt": -0.4901377207616426
									},
									"nextHandle": {
										"dv": 0.8333333333333334,
										"dt": 0.28996207801094903
									}
								},
								{
									"time": 1,
									"value": 1,
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
					"type": "object",
					"name": "Cylinders",
					"x": -0.004601111111111167,
					"y": -6.938893903907228e-18,
					"z": -0.17653444444444444,
					"children": [
						{
							"type": "model",
							"name": "CylinderStraight_02_Gradient",
							"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
							"enabled": false,
							"x": 0.004601111111111056,
							"y": 6.938893903907228e-18,
							"z": -1.4122755555555562,
							"scaleX": 8.1,
							"scaleY": 8.1,
							"scaleZ": 7,
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
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.21,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0.02
										],
										"uvShiftSpeed": [
											0,
											0
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
											0.788235294117647,
											0.07450980392156863,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 1.695870985634219,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.519851082572802,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keys": [
										{
											"time": 1.4305025958395992,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5784075374823732,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"enabled": false,
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": true,
										"bias": 0.18,
										"scale": 1,
										"power": 0.5,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 7,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderStraight_02-Pattern",
							"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
							"z": -1.41228,
							"scaleX": 8.1,
							"scaleY": 8.1,
							"scaleZ": 5,
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/CACA.png"
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keys": [
										{
											"time": 1.4305025958395992,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5784075374823732,
											"value": 2,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap-gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.17,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.48239160045169605,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10913754046752937
													}
												},
												{
													"time": 0.72751909962206,
													"value": 1.0240771124078043,
													"mode": 2
												},
												{
													"time": 0.9931824942575265,
													"value": 0,
													"prevHandle": {
														"dv": -0.017222222222223582,
														"dt": -0.1692722514491467
													},
													"nextHandle": {
														"dv": 0.0067485114873715125,
														"dt": 0.06582174954353627
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
													"time": 0.48239160045169605,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10913754046752937
													}
												},
												{
													"time": 0.6858807147276571,
													"value": 1.0240771124078043,
													"mode": 2
												},
												{
													"time": 0.8472052846412008,
													"value": 0,
													"prevHandle": {
														"dv": -0.017222222222223582,
														"dt": -0.1692722514491467
													},
													"nextHandle": {
														"dv": 0.0067485114873715125,
														"dt": 0.06582174954353627
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.6509803921568628,
											0.07058823529411765,
											0.07058823529411765
										],
										"pointA": 0,
										"colorB": [
											0.9254901960784314,
											0.18823529411764706,
											0.09803921568627451
										],
										"pointB": 0.38
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
										"shiftSpeedX": 0.02,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/Gradients/Dissolve_ShieldBase.png",
										"directionalNoise": true,
										"intensity": 0.07,
										"scrollSpeed": [
											0,
											0.2
										],
										"scale": [
											2,
											1
										]
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
														"color": -6801879
													},
													{
														"position": 1,
														"color": -630985
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2,
										"power": 0.8
									}
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
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/vGrad.png",
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
									"keys": [
										{
											"time": 1.5367688792423033,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 3.000851573152098,
											"value": 1,
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
					"name": "NightEmissive",
					"source": "shaders/NightEmissive.hx",
					"props": {
						"amount": 0.7,
						"ATTENUATE": true,
						"emissiveMap": null
					}
				}
			]
		}
	]
}