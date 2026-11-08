{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"enabled": false,
			"x": 36.58533,
			"y": -14.78105,
			"z": -10,
			"children": [
				{
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"z": 10,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Wraith/Anim_Wraith_AttackRange.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Floor",
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"editorOnly": true,
							"x": 3.12448,
							"y": -8.68385,
							"z": 0.44,
							"scaleX": 4000,
							"scaleY": 4000,
							"scaleZ": 2,
							"color": -14869219,
							"kind": 0,
							"args": [
								0
							]
						},
						{
							"type": "object",
							"name": "Poison",
							"z": 3.9876066666666667,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"children": [
								{
									"type": "object",
									"name": "PoisonFloor",
									"z": -3.9876066666666667,
									"children": [
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"enabled": false,
											"scaleX": 100,
											"scaleY": 100,
											"scaleZ": 10,
											"rotationZ": 82.5,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.42,
														"saturation": 0.8,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 3,
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
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 4,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															0.05
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
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.13333333333333333,
															0.34509803921568627,
															0.08627450980392157
														],
														"pointA": 0,
														"colorB": [
															0.24313725490196078,
															0.5058823529411764,
															0.18823529411764706
														],
														"pointB": 0.58
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 32,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"enabled": false,
											"scaleX": 100,
											"scaleY": 100,
											"scaleZ": 10,
											"rotationZ": 82.5,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TEST03.png"
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
														"progress": 0.42,
														"saturation": 0.8,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 3,
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
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 4,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															0.05
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
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.13333333333333333,
															0.34509803921568627,
															0.08627450980392157
														],
														"pointA": 0,
														"colorB": [
															0.24313725490196078,
															0.5058823529411764,
															0.18823529411764706
														],
														"pointB": 0.58
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 32,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"scaleX": 160,
											"scaleY": 160,
											"scaleZ": 27,
											"rotationZ": 89.99999999999999,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PosionAlpha03.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 3,
														"texture": "Fx/Gradients/circGrad3.jpg",
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															0.05
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
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.07450980392156863,
															0.3137254901960784,
															0.08627450980392157
														],
														"pointA": 0,
														"colorB": [
															0.24313725490196078,
															0.5058823529411764,
															0.18823529411764706
														],
														"pointB": 0.58
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 64,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors-motif",
											"x": 0.11465,
											"y": -0.07231,
											"scaleX": 160,
											"scaleY": 160,
											"scaleZ": 27,
											"rotationZ": 90,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PosionAlpha03.png"
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
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															0.05
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.42,
														"saturation": 0.39,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/noise/causticTexture-2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.01,
															null
														]
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3094708
																	}
																],
																"resolution": 64
															}
														}
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
														"progress": 0.28,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 4,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															0.05
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
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 3.976678071580828,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.005396193672220227,
																"dt": -0.4999945410973484
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 3.0885631086677323
															}
														},
														{
															"time": 9.966181296333671,
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
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
					"name": "Valve",
					"y": -1.29135,
					"children": [
						{
							"type": "object",
							"name": "Cylinder_1",
							"children": [
								{
									"type": "model",
									"name": "CylinderStraight_1",
									"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.9
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
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.2
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl07u_A.png",
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													3
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderStraight_1_Start",
									"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.25
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -1.5,
											"scaleX": 5.25,
											"scaleY": 1.25,
											"rotationX": 91.32793354836583,
											"rotationY": -0.23099148833885072,
											"rotationZ": 99.86081962779792,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.2,
															0
														]
													}
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
														"texture": "Fx/Gradients/circGrad01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.1822222222222223,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3511111111111112,
																	"value": 1,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
									"name": "M_Disk_WaterfallRipples_1",
									"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
									"y": -6,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													-0.75
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
																"color": -12297933
															},
															{
																"position": 0.37109375,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -3548088
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3958200251768313,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.8113405893529118,
														"dt": -0.27735009811261474
													},
													"nextHandle": {
														"dv": 0.85,
														"dt": 0.08318294975359519
													}
												},
												{
													"time": 1.6958200251768314,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.08610045141417322
													},
													"nextHandle": {
														"dv": 0.019299614970643496,
														"dt": 0.09995920864606948
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
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
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 1.25,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 50,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"instSpeed": [
											0,
											0,
											10
										],
										"instSpeed_rand": [
											0,
											0,
											6
										],
										"instAcceleration_rand": [
											-4,
											-4,
											0
										],
										"enableSort": false,
										"instScale": 3.25,
										"seedGroup": 2,
										"tag": null,
										"emitType": "Burst",
										"burstParticleCount": 4,
										"instAcceleration": [
											2,
											2,
											0
										],
										"lifeTimeRand": 0.5,
										"warmUpTime": -1.1
									},
									"y": -1.22503,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationX": 90,
									"rotationY": -10.4,
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
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																	"value": 0.8573547202779161,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1.4058268495515969,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.31063829787234043,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6647058823529411,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.46078431372549017,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_02.jpg.png",
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
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
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
																	}
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67
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
																	"mode": 2
																},
																{
																	"time": 0.0313895804049744,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6699999999999999
																	},
																	"nextHandle": {
																		"dv": -2.5581510915522486e-16,
																		"dt": 0.3133333333333333
																	}
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
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
													}
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
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026997755331088613,
														"dt": -0.7749999999999999
													},
													"nextHandle": {
														"dv": 0.012705940615832523,
														"dt": 0.3333055879251503
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors",
									"x": -2.65546,
									"y": -6.77753,
									"z": -2.20994,
									"scaleX": 12,
									"scaleY": 15,
									"scaleZ": 6,
									"rotationX": 90,
									"rotationY": -122.9,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_PoisonTrail.png"
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
												"progress": 0.39,
												"saturation": 0.35,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/T_SideMask2.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.5
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.02,
													-0.25
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
															"time": 0.443726249597967,
															"value": 0,
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
															"time": 1.92,
															"value": 1.0333333333333334,
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
															"time": 0.6049999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.028940824188075507,
																"dt": -0.4999293984746551
															},
															"nextHandle": {
																"dv": -0.0344444444444445,
																"dt": 0.595
															}
														},
														{
															"time": 2.835,
															"value": 1.0333333333333334,
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
																"color": -13740786
															},
															{
																"position": 0.37109375,
																"color": -9267412
															},
															{
																"position": 1,
																"color": -4467200
															}
														],
														"resolution": 64
													}
												}
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
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
															"time": 1.0199999999999996,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00672021158182709,
																"dt": -0.49998374168793364
															},
															"nextHandle": {
																"dv": -0.00833333333333336,
																"dt": 0.6199999999999994
															}
														},
														{
															"time": 1.7049999999999996,
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
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -2,
											"z": -0.00212,
											"scaleX": 4,
											"scaleY": 2,
											"rotationX": 91.3,
											"rotationY": -0.2,
											"rotationZ": 99.9,
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
															"emissive": 0.2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.39,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.5,
															0
														]
													}
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25777777777777783,
																	"value": 0.9666666666666667,
																	"mode": 2
																},
																{
																	"time": 1.1377777777777778,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.13333333333333308
																	},
																	"nextHandle": {
																		"dv": -1.1974324258329674e-16,
																		"dt": 0.1303703703703704
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.482,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.6833333333333333,
																		"dt": -0.4119999999999999
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 1.835,
																	"value": 0,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.14969825436878326,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.379277122761553,
																"dt": -0.1352157490531156
															},
															"nextHandle": {
																"dv": 1.0166666666666666,
																"dt": 0.05597636672151013
															}
														},
														{
															"time": 0.3302830229508076,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/uGrad.png",
														"uvShift": [
															0.015,
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
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Distort",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"y": -6,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": -90,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.535820025176832,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.948512879624462,
														"dt": -0.07625464343856375
													},
													"nextHandle": {
														"dv": 0.9666666666666667,
														"dt": 0.024179974823168582
													}
												},
												{
													"time": 1.835820025176832,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.21082002517683152
													},
													"nextHandle": {
														"dv": -0.01587514615204094,
														"dt": 0.10001342075785845
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														},
														{
															"time": 3.0100000000000002,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.2950000000000004
															},
															"nextHandle": {
																"dv": 0.011275339293792676,
																"dt": 0.43804693156384644
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.01
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"y": -1.5,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 3,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25,
												"burstCount": 2
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 5,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
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
									"type": "emitter",
									"name": "Flare",
									"enabled": false,
									"props": {
										"alignMode": "Screen",
										"instScale_rand": 0,
										"maxCount": 50,
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
											180
										],
										"lifeTime": 0.04,
										"instScale": 4,
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
										]
									},
									"x": 0.00015,
									"y": -1.54636,
									"z": -0.01037,
									"scaleX": 0.9999999999999996,
									"scaleY": 0.9999999999999996,
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
															"emissive": 10
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png",
													"color": [
														1,
														0.5176470588235293,
														0.396078431372549,
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png",
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
															0.5058823529411764,
															0.6039215686274509,
															0.3176470588235294
														]
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
							"name": "Cylinder_2",
							"children": [
								{
									"type": "model",
									"name": "CylinderStraight_1",
									"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.9
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
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.2
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl07u_A.png",
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													3
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderStraight_1_Start",
									"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.25
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -1.5,
											"scaleX": 5.25,
											"scaleY": 1.25,
											"rotationX": 91.32793354836583,
											"rotationY": -0.23099148833885072,
											"rotationZ": 99.86081962779792,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.2,
															0
														]
													}
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
														"texture": "Fx/Gradients/circGrad01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.1822222222222223,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3511111111111112,
																	"value": 1,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
									"name": "M_Disk_WaterfallRipples_1",
									"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
									"y": -6,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													-0.75
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
																"color": -12297933
															},
															{
																"position": 0.37109375,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -3548088
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3958200251768313,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.8113405893529118,
														"dt": -0.27735009811261474
													},
													"nextHandle": {
														"dv": 0.85,
														"dt": 0.08318294975359519
													}
												},
												{
													"time": 1.6958200251768314,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.08610045141417322
													},
													"nextHandle": {
														"dv": 0.019299614970643496,
														"dt": 0.09995920864606948
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
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
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 1.25,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 50,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"instSpeed": [
											0,
											0,
											10
										],
										"instSpeed_rand": [
											0,
											0,
											6
										],
										"instAcceleration_rand": [
											-4,
											-4,
											0
										],
										"enableSort": false,
										"instScale": 3.25,
										"seedGroup": 2,
										"tag": null,
										"emitType": "Burst",
										"burstParticleCount": 4,
										"instAcceleration": [
											2,
											2,
											0
										],
										"lifeTimeRand": 0.5,
										"warmUpTime": -1.1
									},
									"y": -1.22503,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationX": 90,
									"rotationY": -10.4,
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
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																	"value": 0.8573547202779161,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1.4058268495515969,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.31063829787234043,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6647058823529411,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.46078431372549017,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_02.jpg.png",
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
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
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
																	}
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67
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
																	"mode": 2
																},
																{
																	"time": 0.0313895804049744,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6699999999999999
																	},
																	"nextHandle": {
																		"dv": -2.5581510915522486e-16,
																		"dt": 0.3133333333333333
																	}
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
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
													}
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
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026997755331088613,
														"dt": -0.7749999999999999
													},
													"nextHandle": {
														"dv": 0.012705940615832523,
														"dt": 0.3333055879251503
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors",
									"x": 2.92088,
									"y": -6.77753,
									"z": -2.40139,
									"scaleX": 12,
									"scaleY": 15,
									"scaleZ": 6,
									"rotationX": 90,
									"rotationY": 137.4,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_PoisonTrail.png"
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
												"progress": 0.39,
												"saturation": 0.35,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/T_SideMask2.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.5
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.02,
													-0.25
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
															"time": 0.443726249597967,
															"value": 0,
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
															"time": 1.92,
															"value": 1.0333333333333334,
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
															"time": 0.6049999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.028940824188075507,
																"dt": -0.4999293984746551
															},
															"nextHandle": {
																"dv": -0.0344444444444445,
																"dt": 0.595
															}
														},
														{
															"time": 2.835,
															"value": 1.0333333333333334,
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
																"color": -13740786
															},
															{
																"position": 0.37109375,
																"color": -9267412
															},
															{
																"position": 1,
																"color": -4467200
															}
														],
														"resolution": 64
													}
												}
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
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
															"time": 1.0199999999999996,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00672021158182709,
																"dt": -0.49998374168793364
															},
															"nextHandle": {
																"dv": -0.00833333333333336,
																"dt": 0.6199999999999994
															}
														},
														{
															"time": 1.7049999999999996,
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
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -2,
											"z": -0.00212,
											"scaleX": 4,
											"scaleY": 2,
											"rotationX": 91.3,
											"rotationY": -0.2,
											"rotationZ": 99.9,
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
															"emissive": 0.2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.39,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.5,
															0
														]
													}
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25777777777777783,
																	"value": 0.9666666666666667,
																	"mode": 2
																},
																{
																	"time": 1.1377777777777778,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.13333333333333308
																	},
																	"nextHandle": {
																		"dv": -1.1974324258329674e-16,
																		"dt": 0.1303703703703704
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.482,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.6833333333333333,
																		"dt": -0.4119999999999999
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 1.835,
																	"value": 0,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.14969825436878326,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.379277122761553,
																"dt": -0.1352157490531156
															},
															"nextHandle": {
																"dv": 1.0166666666666666,
																"dt": 0.05597636672151013
															}
														},
														{
															"time": 0.3302830229508076,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/uGrad.png",
														"uvShift": [
															0.015,
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
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Distort",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"y": -6,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": -90,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.535820025176832,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.948512879624462,
														"dt": -0.07625464343856375
													},
													"nextHandle": {
														"dv": 0.9666666666666667,
														"dt": 0.024179974823168582
													}
												},
												{
													"time": 1.835820025176832,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.21082002517683152
													},
													"nextHandle": {
														"dv": -0.01587514615204094,
														"dt": 0.10001342075785845
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														},
														{
															"time": 3.0100000000000002,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.2950000000000004
															},
															"nextHandle": {
																"dv": 0.011275339293792676,
																"dt": 0.43804693156384644
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.01
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"y": -1.5,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 5,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
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
							"name": "Cylinder_3",
							"children": [
								{
									"type": "model",
									"name": "CylinderStraight_1",
									"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.9
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
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.2
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl07u_A.png",
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													3
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderStraight_1_Start",
									"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.25
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -1.5,
											"scaleX": 5.25,
											"scaleY": 1.25,
											"rotationX": 91.32793354836583,
											"rotationY": -0.23099148833885072,
											"rotationZ": 99.86081962779792,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.2,
															0
														]
													}
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
														"texture": "Fx/Gradients/circGrad01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.1822222222222223,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3511111111111112,
																	"value": 1,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
									"name": "M_Disk_WaterfallRipples_1",
									"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
									"y": -6,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													-0.75
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
																"color": -12297933
															},
															{
																"position": 0.37109375,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -3548088
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3958200251768313,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.8113405893529118,
														"dt": -0.27735009811261474
													},
													"nextHandle": {
														"dv": 0.85,
														"dt": 0.08318294975359519
													}
												},
												{
													"time": 1.6958200251768314,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.08610045141417322
													},
													"nextHandle": {
														"dv": 0.019299614970643496,
														"dt": 0.09995920864606948
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
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
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 1.25,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 50,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"instSpeed": [
											0,
											0,
											10
										],
										"instSpeed_rand": [
											0,
											0,
											6
										],
										"instAcceleration_rand": [
											-4,
											-4,
											0
										],
										"enableSort": false,
										"instScale": 3.25,
										"seedGroup": 2,
										"tag": null,
										"emitType": "Burst",
										"burstParticleCount": 4,
										"instAcceleration": [
											2,
											2,
											0
										],
										"lifeTimeRand": 0.5,
										"warmUpTime": -1.1
									},
									"y": -1.22503,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationX": 90,
									"rotationY": -10.4,
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
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																	"value": 0.8573547202779161,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1.4058268495515969,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.31063829787234043,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6647058823529411,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.46078431372549017,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_02.jpg.png",
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
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
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
																	}
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67
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
																	"mode": 2
																},
																{
																	"time": 0.0313895804049744,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6699999999999999
																	},
																	"nextHandle": {
																		"dv": -2.5581510915522486e-16,
																		"dt": 0.3133333333333333
																	}
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
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
													}
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
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026997755331088613,
														"dt": -0.7749999999999999
													},
													"nextHandle": {
														"dv": 0.012705940615832523,
														"dt": 0.3333055879251503
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors",
									"x": -2.52973,
									"y": -6.77753,
									"z": -2.89265,
									"scaleX": 12,
									"scaleY": 15,
									"scaleZ": 6,
									"rotationX": 90,
									"rotationY": -133.8,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_PoisonTrail.png"
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
												"progress": 0.39,
												"saturation": 0.35,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/T_SideMask2.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.5
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.02,
													-0.25
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
															"time": 0.443726249597967,
															"value": 0,
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
															"time": 1.92,
															"value": 1.0333333333333334,
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
															"time": 0.6049999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.028940824188075507,
																"dt": -0.4999293984746551
															},
															"nextHandle": {
																"dv": -0.0344444444444445,
																"dt": 0.595
															}
														},
														{
															"time": 2.835,
															"value": 1.0333333333333334,
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
																"color": -13740786
															},
															{
																"position": 0.37109375,
																"color": -9267412
															},
															{
																"position": 1,
																"color": -4467200
															}
														],
														"resolution": 64
													}
												}
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
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
															"time": 1.0199999999999996,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00672021158182709,
																"dt": -0.49998374168793364
															},
															"nextHandle": {
																"dv": -0.00833333333333336,
																"dt": 0.6199999999999994
															}
														},
														{
															"time": 1.7049999999999996,
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
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -2,
											"z": -0.00212,
											"scaleX": 4,
											"scaleY": 2,
											"rotationX": 91.3,
											"rotationY": -0.2,
											"rotationZ": 99.9,
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
															"emissive": 0.2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.39,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.5,
															0
														]
													}
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25777777777777783,
																	"value": 0.9666666666666667,
																	"mode": 2
																},
																{
																	"time": 1.1377777777777778,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.13333333333333308
																	},
																	"nextHandle": {
																		"dv": -1.1974324258329674e-16,
																		"dt": 0.1303703703703704
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.482,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.6833333333333333,
																		"dt": -0.4119999999999999
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 1.835,
																	"value": 0,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.14969825436878326,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.379277122761553,
																"dt": -0.1352157490531156
															},
															"nextHandle": {
																"dv": 1.0166666666666666,
																"dt": 0.05597636672151013
															}
														},
														{
															"time": 0.3302830229508076,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/uGrad.png",
														"uvShift": [
															0.015,
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
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Distort",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"y": -6,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": -90,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.535820025176832,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.948512879624462,
														"dt": -0.07625464343856375
													},
													"nextHandle": {
														"dv": 0.9666666666666667,
														"dt": 0.024179974823168582
													}
												},
												{
													"time": 1.835820025176832,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.21082002517683152
													},
													"nextHandle": {
														"dv": -0.01587514615204094,
														"dt": 0.10001342075785845
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														},
														{
															"time": 3.0100000000000002,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.2950000000000004
															},
															"nextHandle": {
																"dv": 0.011275339293792676,
																"dt": 0.43804693156384644
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.01
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"y": -1.5,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 3,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25,
												"burstCount": 2
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 5,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
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
							"name": "Cylinder_4",
							"children": [
								{
									"type": "model",
									"name": "CylinderStraight_1",
									"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.9
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
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.2
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl07u_A.png",
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													3
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderStraight_1_Start",
									"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
									"y": -1.25,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.75,
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
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.25
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -1.5,
											"scaleX": 5.25,
											"scaleY": 1.25,
											"rotationX": 91.32793354836583,
											"rotationY": -0.23099148833885072,
											"rotationZ": 99.86081962779792,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.2,
															0
														]
													}
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
														"texture": "Fx/Gradients/circGrad01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.1822222222222223,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3511111111111112,
																	"value": 1,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
									"name": "M_Disk_WaterfallRipples_1",
									"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
									"y": -6,
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													-0.75
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
																"color": -12297933
															},
															{
																"position": 0.37109375,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -3548088
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3958200251768313,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.8113405893529118,
														"dt": -0.27735009811261474
													},
													"nextHandle": {
														"dv": 0.85,
														"dt": 0.08318294975359519
													}
												},
												{
													"time": 1.6958200251768314,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.08610045141417322
													},
													"nextHandle": {
														"dv": 0.019299614970643496,
														"dt": 0.09995920864606948
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
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
									"name": "Smoke_Big_1",
									"props": {
										"lifeTime": 1.25,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 50,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 0,
										"instSpeed": [
											0,
											0,
											10
										],
										"instSpeed_rand": [
											0,
											0,
											6
										],
										"instAcceleration_rand": [
											-4,
											-4,
											0
										],
										"enableSort": false,
										"instScale": 3.25,
										"seedGroup": 2,
										"tag": null,
										"emitType": "Burst",
										"burstParticleCount": 4,
										"instAcceleration": [
											2,
											2,
											0
										],
										"lifeTimeRand": 0.5,
										"warmUpTime": -1.1
									},
									"y": -1.22503,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationX": 90,
									"rotationY": -10.4,
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
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																	"value": 0.8573547202779161,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 1.4058268495515969,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.31063829787234043,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6647058823529411,
																	"mode": 2
																},
																{
																	"time": 0.28,
																	"value": 0.46078431372549017,
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_02.jpg.png",
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
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
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
																	}
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67
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
																	"mode": 2
																},
																{
																	"time": 0.0313895804049744,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6699999999999999
																	},
																	"nextHandle": {
																		"dv": -2.5581510915522486e-16,
																		"dt": 0.3133333333333333
																	}
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
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
													}
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
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026997755331088613,
														"dt": -0.7749999999999999
													},
													"nextHandle": {
														"dv": 0.012705940615832523,
														"dt": 0.3333055879251503
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07237122028132559,
														"dt": -0.5349999999999999
													},
													"nextHandle": {
														"dv": 0.04162030102982175,
														"dt": 0.30767563355153715
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors",
									"x": 2.6292,
									"y": -6.77753,
									"z": -2.61667,
									"scaleX": 12,
									"scaleY": 15,
									"scaleZ": 6,
									"rotationX": 90,
									"rotationY": 136,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_PoisonTrail.png"
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
												"progress": 0.39,
												"saturation": 0.35,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/T_SideMask2.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.5
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
												"progress": 0.27,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.02,
													-0.25
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
															"time": 0.443726249597967,
															"value": 0,
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
															"time": 1.92,
															"value": 1.0333333333333334,
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
															"time": 0.6049999999999998,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.028940824188075507,
																"dt": -0.4999293984746551
															},
															"nextHandle": {
																"dv": -0.0344444444444445,
																"dt": 0.595
															}
														},
														{
															"time": 2.835,
															"value": 1.0333333333333334,
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
																"color": -13740786
															},
															{
																"position": 0.37109375,
																"color": -9267412
															},
															{
																"position": 1,
																"color": -4467200
															}
														],
														"resolution": 64
													}
												}
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
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
															"time": 1.0199999999999996,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00672021158182709,
																"dt": -0.49998374168793364
															},
															"nextHandle": {
																"dv": -0.00833333333333336,
																"dt": 0.6199999999999994
															}
														},
														{
															"time": 1.7049999999999996,
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
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -2,
											"z": -0.00212,
											"scaleX": 4,
											"scaleY": 2,
											"rotationX": 91.3,
											"rotationY": -0.2,
											"rotationZ": 99.9,
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
															"emissive": 0.2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.39,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.5,
															0
														]
													}
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25777777777777783,
																	"value": 0.9666666666666667,
																	"mode": 2
																},
																{
																	"time": 1.1377777777777778,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.13333333333333308
																	},
																	"nextHandle": {
																		"dv": -1.1974324258329674e-16,
																		"dt": 0.1303703703703704
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.482,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.6833333333333333,
																		"dt": -0.4119999999999999
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 1.835,
																	"value": 0,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.14969825436878326,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.379277122761553,
																"dt": -0.1352157490531156
															},
															"nextHandle": {
																"dv": 1.0166666666666666,
																"dt": 0.05597636672151013
															}
														},
														{
															"time": 0.3302830229508076,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
														"useScale": true,
														"wrap": true,
														"progress": 0.7,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/uGrad.png",
														"uvShift": [
															0.015,
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
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Distort",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"y": -6,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": -90,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.535820025176832,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.948512879624462,
														"dt": -0.07625464343856375
													},
													"nextHandle": {
														"dv": 0.9666666666666667,
														"dt": 0.024179974823168582
													}
												},
												{
													"time": 1.835820025176832,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.21082002517683152
													},
													"nextHandle": {
														"dv": -0.01587514615204094,
														"dt": 0.10001342075785845
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														},
														{
															"time": 3.0100000000000002,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.2950000000000004
															},
															"nextHandle": {
																"dv": 0.011275339293792676,
																"dt": 0.43804693156384644
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.01
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"y": -1.5,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 3,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25,
												"burstCount": 2
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Smoke_Anticipation",
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0.25,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													1.5,
													1.5,
													3
												],
												"instSpeed_rand": [
													-3,
													-3,
													0.5
												],
												"enableSort": false,
												"seedGroup": 2,
												"tag": null,
												"burstDelay": 0.4,
												"simulationSpace": "World",
												"lifeTime": 5,
												"lifeTimeRand": 0.2,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"instScale": 1.75,
												"speedFactor": 1.25
											},
											"scaleX": 0.5,
											"scaleY": 0.49999999999999983,
											"scaleZ": 0.4999999999999999,
											"rotationX": 89.99999999999999,
											"rotationY": -10.400000000000002,
											"rotationZ": 5.052623868479036e-17,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"enabled": false,
															"props": {
																"scale": 2
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 0.8423412877569597,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.35,
																				"dt": -0.2776587122430403
																			},
																			"nextHandle": {
																				"dv": -0.38337468689060245,
																				"dt": 0.30183149952022004
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.5
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
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
																"dv": 1.5486560128154876,
																"dt": -0.2818717822267342
															},
															"nextHandle": {
																"dv": -1.05,
																"dt": 0.18900795442362628
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
																"dv": 1.5993130932810984,
																"dt": -0.2609824351224878
															},
															"nextHandle": {
																"dv": -1.1166666666666667,
																"dt": 0.1801190655347374
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.6821031566874849
															},
															"nextHandle": {
																"dv": 0.008169502204984929,
																"dt": 0.333315689963399
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6732142677985959
															},
															"nextHandle": {
																"dv": -0.008277702817786541,
																"dt": 0.33331550012954636
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -2.881032571136126,
																"dt": -0.26043232281456535
															},
															"nextHandle": {
																"dv": 1.77,
																"dt": 0.1578968433125152
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.7221031566874848
															},
															"nextHandle": {
																"dv": -5.087740091982619e-16,
																"dt": 0.30773741188524595
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keys": [
														{
															"time": 0.2912301766458485,
															"value": 1.8,
															"mode": 2
														},
														{
															"time": 0.3490079544236263,
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
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Valve.Cylinder_1",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle.GasTube01"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Valve.Cylinder_2",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle.GasTube02"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Valve.Cylinder_3",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle.GasTube03"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Valve.Cylinder_4",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle.GasTube04"
				},
				{
					"type": "object",
					"name": "Anticipation",
					"z": 11.03883,
					"rotationZ": -12.7,
					"children": [
						{
							"type": "light",
							"name": "light_1",
							"z": 0.86632,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"rotationZ": 12.7,
							"color": 12310016,
							"power": 2,
							"range": 15,
							"size": 3,
							"zNear": 0.02,
							"children": [
								{
									"type": "curve",
									"name": "power",
									"keyMode": 1,
									"keys": [
										{
											"time": 1.1361865569272984,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 2.620340667841006e-16,
												"dt": -0.3331935687031608
											},
											"nextHandle": {
												"dv": -0.025000000000000022,
												"dt": 0.07801097393689971
											}
										},
										{
											"time": 1.2940946502057613,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -1.65,
												"dt": 0.000905349794238175
											},
											"nextHandle": {
												"dv": 0.23857244192697385,
												"dt": 2.9216697737063635e-18
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Wraith_Light",
							"source": "Fx/Meshes_Common/Wraith_Light.fbx",
							"z": -1.236135,
							"scaleX": 2.1000000000000005,
							"scaleY": 2.1000000000000005,
							"scaleZ": 2,
							"rotationZ": -165.92243744485896,
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
											"colorMask": 255,
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.5058823529411764,
											0.6039215686274509,
											0.3176470588235294
										]
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
													"time": 1.1692215363511669,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666663,
														"dt": -0.3202366255144036
													},
													"nextHandle": {
														"dv": -0.002900780156336201,
														"dt": 0.05561857985350141
													}
												},
												{
													"time": 1.2933796296296298,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -1.2333333333333334,
														"dt": 0.0016203703703696615
													},
													"nextHandle": {
														"dv": 0.22882799511226018,
														"dt": 4.203502076543035e-18
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 32,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "anticipation",
							"z": 1.236135,
							"scaleX": 19,
							"scaleY": 19,
							"scaleZ": 2.9999999999999996,
							"rotationX": 1.1000000000000008,
							"rotationY": -178.3,
							"rotationZ": -33.49999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
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
										"alpha": 1,
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
													"time": 0.2599999999999998,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1916136060263233,
														"dt": -0.49580020559311083
													},
													"nextHandle": {
														"dv": -0.04999999999999999,
														"dt": 0.12875000000000025
													}
												},
												{
													"time": 1.1692215363511669,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08333333333333331,
														"dt": -0.3483299039780525
													},
													"nextHandle": {
														"dv": -0.012476812255367791,
														"dt": 0.052051412312764
													}
												},
												{
													"time": 1.2933796296296298,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.9833333333333334,
														"dt": -0.07455246913580282
													},
													"nextHandle": {
														"dv": 0.22194771883201317,
														"dt": 0.016644917855072945
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
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
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
														"color": -13740786
													},
													{
														"position": 0.37109375,
														"color": -9267412
													},
													{
														"position": 1,
														"color": -4467200
													}
												],
												"resolution": 64
											}
										}
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
			"name": "FXRoot_02",
			"editorOnly": true,
			"children": [
				{
					"type": "object",
					"name": "AttackDistance",
					"children": [
						{
							"type": "object",
							"name": "Common",
							"y": 0.1,
							"scaleX": 0.9999999999999999,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "model",
									"name": "Wraith_Cylinders_MoreVrtx",
									"source": "Fx/Meshes_Common/Wraith_Cylinders_MoreVrtx.fbx",
									"y": -1.25,
									"scaleZ": 9.4,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
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
													"keys": [
														{
															"time": 1.1374759945130315,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1474759945130315,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.2
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 1,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl07u_A.png",
												"intensity": 0.4,
												"scrollSpeed": [
													0,
													3
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Wraith_Cylinders",
									"source": "Fx/Meshes_Common/Wraith_Cylinders.fbx",
									"y": -1.25,
									"scaleZ": 9.4,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													1.25
												]
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
																"color": -12297933
															},
															{
																"position": 1,
																"color": -8283567
															}
														],
														"resolution": 64
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
												"range": 5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.001,
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
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.1419204765910052,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.8631878678633056,
														"dt": -0.41710958732312214
													},
													"nextHandle": {
														"dv": 0.65,
														"dt": 0.14484172278766527
													}
												},
												{
													"time": 1.558060800728585,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.1304947679987063
													},
													"nextHandle": {
														"dv": -0.025482322604370118,
														"dt": 0.0999288762356679
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"enabled": false,
									"target": "camera",
									"lockAxis": [
										0,
										1,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": -1.5,
											"scaleX": 5.25,
											"scaleY": 1.25,
											"rotationX": 91.32793354836583,
											"rotationY": -0.23099148833885072,
											"rotationZ": 99.86081962779792,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.2,
															0
														]
													}
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
														"texture": "Fx/Gradients/circGrad01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.1822222222222223,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3511111111111112,
																	"value": 1,
																	"mode": 2
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
																		"position": 0.07421875,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -8108
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
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
									"name": "Wraith_Ripples",
									"source": "Fx/Meshes_Common/Wraith_Ripples.fbx",
									"enabled": false,
									"x": 0.02986,
									"y": -7.82609,
									"z": 0.06033,
									"rotationX": -90,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.025,
													-0.75
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
																"color": -12297933
															},
															{
																"position": 0.37109375,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -3548088
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3958200251768313,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.8113405893529118,
														"dt": -0.27735009811261474
													},
													"nextHandle": {
														"dv": 0.85,
														"dt": 0.08318294975359519
													}
												},
												{
													"time": 1.6958200251768314,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.08610045141417322
													},
													"nextHandle": {
														"dv": 0.019299614970643496,
														"dt": 0.09995920864606948
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
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
									"name": "Distort",
									"source": "Fx/Meshes_Common/Wraith_Distort.fbx",
									"enabled": false,
									"y": -7,
									"z": 0.06033,
									"rotationX": -90,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap_gradientin",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"name": "DissolveMap_gradientout",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.76,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.535820025176832,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.948512879624462,
														"dt": -0.07625464343856375
													},
													"nextHandle": {
														"dv": 0.9666666666666667,
														"dt": 0.024179974823168582
													}
												},
												{
													"time": 1.835820025176832,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.033333333333333215,
														"dt": -0.21082002517683152
													},
													"nextHandle": {
														"dv": -0.01587514615204094,
														"dt": 0.10001342075785845
													}
												}
											]
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														},
														{
															"time": 3.0100000000000002,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -1.2950000000000004
															},
															"nextHandle": {
																"dv": 0.011275339293792676,
																"dt": 0.43804693156384644
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
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.9286303273787566,
																"dt": -0.1277947779219821
															},
															"nextHandle": {
																"dv": 0.9166666666666667,
																"dt": 0.039179974823168706
															}
														},
														{
															"time": 1.525,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.01
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Wraith_Crossplanes",
									"source": "Fx/Meshes_Common/Wraith_Crossplanes.fbx",
									"enabled": false,
									"y": -4.21589,
									"scaleZ": 3,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-1.2
												]
											}
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
												"texture": "Fx/Gradients/circGrad01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 1.1822222222222223,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3511111111111112,
															"value": 1,
															"mode": 2
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
																"position": 0.07421875,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -8108
															}
														],
														"resolution": 64
													}
												}
											}
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.25777777777777783,
															"value": 0.9666666666666667,
															"mode": 2
														},
														{
															"time": 1.1377777777777778,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.13333333333333308
															},
															"nextHandle": {
																"dv": -1.1974324258329674e-16,
																"dt": 0.1303703703703704
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.482,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.6833333333333333,
																"dt": -0.4119999999999999
															},
															"nextHandle": {
																"dv": -0.7333333333333334,
																"dt": 0.011669411659240847
															}
														},
														{
															"time": 1.835,
															"value": 0,
															"mode": 2
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
																"position": 0.07421875,
																"color": -8283567
															},
															{
																"position": 1,
																"color": -8108
															}
														],
														"resolution": 64
													}
												}
											}
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
												"progress": 0.7,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/uGrad.png",
												"uvShift": [
													0.015,
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
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"editorOnly": true,
							"y": -7.5,
							"scaleX": 4000.000000000001,
							"scaleY": 4000.0000000000005,
							"rotationX": -90,
							"color": -14869219,
							"kind": 0,
							"args": [
								0
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"y": -6,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"rotationX": 90,
							"children": [
								{
									"type": "object",
									"name": "Poison",
									"children": [
										{
											"type": "object",
											"name": "PoisonFloor",
											"z": 5.18567,
											"children": [
												{
													"type": "advancedDecal",
													"name": "FloorVapors",
													"x": 6.4014,
													"y": 1.05842,
													"scaleX": 160,
													"scaleY": 160,
													"scaleZ": 27,
													"rotationZ": 109.2,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 3,
													"renderMode": "BeforeTonemapping",
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_PosionAlpha03.png"
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": false,
																"wrap": true,
																"progress": 0.36,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 3,
																"texture": "Fx/Gradients/circGrad3.jpg",
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
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.45,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.02,
																	0.05
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
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.07450980392156863,
																	0.3137254901960784,
																	0.08627450980392157
																],
																"pointA": 0,
																"colorB": [
																	0.24313725490196078,
																	0.5058823529411764,
																	0.18823529411764706
																],
																"pointB": 0.58
															}
														},
														{
															"type": "curve",
															"name": "rotation.z",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 64,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "FloorVapors-motif",
													"scaleX": 160,
													"scaleY": 160,
													"scaleZ": 27,
													"rotationZ": 90,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"fadePower": 3,
													"renderMode": "BeforeTonemapping",
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
																"alpha": 0.9,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_PosionAlpha03.png"
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
																"progress": 0.45,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.02,
																	0.05
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
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.42,
																"saturation": 0.39,
																"width": 1,
																"uvScaleX": 1.5,
																"uvScaleY": 1.5,
																"texture": "Fx/noise/causticTexture-2.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.01,
																	null
																]
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -3094708
																			}
																		],
																		"resolution": 64
																	}
																}
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
																"progress": 0.28,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 4,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	-0.02,
																	0.05
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
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.8
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.976678071580828,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.005396193672220227,
																		"dt": -0.4999945410973484
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 3.0885631086677323
																	}
																},
																{
																	"time": 9.966181296333671,
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
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.75,
														"ATTENUATE": true,
														"emissiveMap": null
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
							"name": "Anticipation",
							"y": 0.79973,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationX": 90,
							"rotationY": 30,
							"children": [
								{
									"type": "light",
									"name": "light_0",
									"z": 0.86632,
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
									"rotationZ": 12.7,
									"color": 12310016,
									"power": 2,
									"range": 15,
									"size": 3,
									"zNear": 0.02,
									"children": [
										{
											"type": "curve",
											"name": "power",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.1361865569272984,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 2.620340667841006e-16,
														"dt": -0.3331935687031608
													},
													"nextHandle": {
														"dv": -0.025000000000000022,
														"dt": 0.07801097393689971
													}
												},
												{
													"time": 1.2940946502057613,
													"value": 1.5,
													"mode": 0,
													"prevHandle": {
														"dv": -1.65,
														"dt": 0.000905349794238175
													},
													"nextHandle": {
														"dv": 0.23857244192697385,
														"dt": 2.9216697737063635e-18
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Wraith_Light",
									"source": "Fx/Meshes_Common/Wraith_Light.fbx",
									"z": -1.236135,
									"scaleX": 2.1000000000000005,
									"scaleY": 2.1000000000000005,
									"scaleZ": 2,
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
													"colorMask": 255,
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5058823529411764,
													0.6039215686274509,
													0.3176470588235294
												]
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
															"time": 1.1692215363511669,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.3202366255144036
															},
															"nextHandle": {
																"dv": -0.002900780156336201,
																"dt": 0.05561857985350141
															}
														},
														{
															"time": 1.2933796296296298,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.2333333333333334,
																"dt": 0.0016203703703696615
															},
															"nextHandle": {
																"dv": 0.22882799511226018,
																"dt": 4.203502076543035e-18
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 32,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "anticipation",
									"x": 0.01326,
									"y": -0.00014,
									"z": 1.61114,
									"scaleX": 19,
									"scaleY": 19,
									"scaleZ": 2.9999999999999996,
									"rotationX": 1.1,
									"rotationY": -178.3,
									"rotationZ": -33.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
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
												"alpha": 1,
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
															"time": 0.2599999999999998,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0.1916136060263233,
																"dt": -0.49580020559311083
															},
															"nextHandle": {
																"dv": -0.04999999999999999,
																"dt": 0.12875000000000025
															}
														},
														{
															"time": 1.1692215363511669,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08333333333333331,
																"dt": -0.3483299039780525
															},
															"nextHandle": {
																"dv": -0.012476812255367791,
																"dt": 0.052051412312764
															}
														},
														{
															"time": 1.2933796296296298,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.9833333333333334,
																"dt": -0.07455246913580282
															},
															"nextHandle": {
																"dv": 0.22194771883201317,
																"dt": 0.016644917855072945
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
												"range": 3,
												"power": 0.8
											},
											"isInstance": true
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
																"color": -13740786
															},
															{
																"position": 0.37109375,
																"color": -9267412
															},
															{
																"position": 1,
																"color": -4467200
															}
														],
														"resolution": 64
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Valve",
							"y": 0.24194,
							"z": -3.67961,
							"children": [
								{
									"type": "object",
									"name": "Cylinder_1",
									"x": -3.37549,
									"z": 0.29517,
									"rotationY": -95.2,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"x": 0.02986,
											"y": -7.82609,
											"z": 0.06033,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": -2.65546,
											"y": -8,
											"z": -2.20994,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": -122.9,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
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
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"x": 0.02986,
											"y": -7.82609,
											"z": 0.06033,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
									"name": "Cylinder_2",
									"x": 3.36881,
									"z": 0.2699,
									"rotationY": -90.9,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"x": 0.02525,
											"y": -7.82609,
											"z": 0.06241,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": 2.92088,
											"y": -8,
											"z": -2.40139,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": 137.4,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"x": 0.02525,
											"y": -7.82609,
											"z": 0.06241,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
									"name": "Cylinder_3",
									"x": -3.31065,
									"y": 0.24772,
									"z": 7.10397,
									"rotationY": 13.5,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"x": -0.06672,
											"y": -7.82609,
											"z": 0.00893,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": -2.52973,
											"y": -8,
											"z": -2.89265,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": -133.8,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"x": -0.06672,
											"y": -7.82609,
											"z": 0.00893,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"enabled": false,
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 3,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"burstCount": 2
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
									"name": "Cylinder_4",
									"x": 3.35589,
									"y": 0.24772,
									"z": 7.12179,
									"rotationY": -176.1,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"x": 0.0643,
											"y": -7.82609,
											"z": -0.01995,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": 2.6292,
											"y": -8,
											"z": -2.61667,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": 136,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"x": 0.0643,
											"y": -7.82609,
											"z": -0.01995,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"enabled": false,
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 3,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"burstCount": 2
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
								}
							]
						},
						{
							"type": "object",
							"name": "Valve",
							"enabled": false,
							"y": 0.24194,
							"z": -3.67961,
							"children": [
								{
									"type": "object",
									"name": "Cylinder_1",
									"x": -3.37549,
									"z": 0.29517,
									"rotationY": -95.2,
									"children": [
										{
											"type": "model",
											"name": "CylinderStraight_1",
											"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.9
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
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.2
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 1,
														"texScaleY": 1,
														"tex": "Fx/Gradients/Cyl07u_A.png",
														"intensity": 0.4,
														"scrollSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "CylinderStraight_1_Start",
											"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.25
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"y": -6,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": -2.65546,
											"y": -6.77753,
											"z": -2.20994,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": -122.9,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"y": -6,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"enabled": false,
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 3,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"burstCount": 2
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
											"type": "emitter",
											"name": "Flare",
											"enabled": false,
											"props": {
												"alignMode": "Screen",
												"instScale_rand": 0,
												"maxCount": 50,
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
													180
												],
												"lifeTime": 0.04,
												"instScale": 4,
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
												]
											},
											"x": 0.00015,
											"y": -1.54636,
											"z": -0.01037,
											"scaleX": 0.9999999999999996,
											"scaleY": 0.9999999999999996,
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
																	"emissive": 10
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png",
															"color": [
																1,
																0.5176470588235293,
																0.396078431372549,
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
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle.png",
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
																	0.5058823529411764,
																	0.6039215686274509,
																	0.3176470588235294
																]
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
									"name": "Cylinder_2",
									"x": 3.36881,
									"z": 0.2699,
									"rotationY": -90.9,
									"children": [
										{
											"type": "model",
											"name": "CylinderStraight_1",
											"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.9
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
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.2
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 1,
														"texScaleY": 1,
														"tex": "Fx/Gradients/Cyl07u_A.png",
														"intensity": 0.4,
														"scrollSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "CylinderStraight_1_Start",
											"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.25
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"y": -6,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": 2.92088,
											"y": -6.77753,
											"z": -2.40139,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": 137.4,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"y": -6,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
									"name": "Cylinder_3",
									"x": -3.31065,
									"y": 0.24772,
									"z": 7.10397,
									"rotationY": 13.5,
									"children": [
										{
											"type": "model",
											"name": "CylinderStraight_1",
											"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.9
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
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.2
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 1,
														"texScaleY": 1,
														"tex": "Fx/Gradients/Cyl07u_A.png",
														"intensity": 0.4,
														"scrollSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "CylinderStraight_1_Start",
											"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.25
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"y": -6,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": -2.52973,
											"y": -6.77753,
											"z": -2.89265,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": -133.8,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"y": -6,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"enabled": false,
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 3,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"burstCount": 2
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
									"name": "Cylinder_4",
									"x": 3.35589,
									"y": 0.24772,
									"z": 7.12179,
									"rotationY": -176.1,
									"children": [
										{
											"type": "model",
											"name": "CylinderStraight_1",
											"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.9
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
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.2
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 1,
														"texScaleY": 1,
														"tex": "Fx/Gradients/Cyl07u_A.png",
														"intensity": 0.4,
														"scrollSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "CylinderStraight_1_Start",
											"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
											"y": -1.25,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 2.75,
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
															"culling": "Back",
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.63,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															1.25
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 1,
																		"color": -8283567
																	}
																],
																"resolution": 64
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
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0.001,
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
													"type": "curve",
													"name": "scale.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1419204765910052,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.8631878678633056,
																"dt": -0.41710958732312214
															},
															"nextHandle": {
																"dv": 0.65,
																"dt": 0.14484172278766527
															}
														},
														{
															"time": 1.558060800728585,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.1304947679987063
															},
															"nextHandle": {
																"dv": -0.025482322604370118,
																"dt": 0.0999288762356679
															}
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -1.5,
													"scaleX": 5.25,
													"scaleY": 1.25,
													"rotationX": 91.32793354836583,
													"rotationY": -0.23099148833885072,
													"rotationZ": 99.86081962779792,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.63,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Water_06.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.2,
																	0
																]
															}
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
																"texture": "Fx/Gradients/circGrad01.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 1.1822222222222223,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3511111111111112,
																			"value": 1,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
											"name": "M_Disk_WaterfallRipples_1",
											"source": "Fx/Meshes_Common/M_Waterfall_Ripples01.fbx",
											"y": -6,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -90,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.025,
															-0.75
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
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
																		"color": -12297933
																	},
																	{
																		"position": 0.37109375,
																		"color": -8283567
																	},
																	{
																		"position": 1,
																		"color": -3548088
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3958200251768313,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8113405893529118,
																"dt": -0.27735009811261474
															},
															"nextHandle": {
																"dv": 0.85,
																"dt": 0.08318294975359519
															}
														},
														{
															"time": 1.6958200251768314,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.08610045141417322
															},
															"nextHandle": {
																"dv": 0.019299614970643496,
																"dt": 0.09995920864606948
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.8113405893529118,
																		"dt": -0.27735009811261474
																	},
																	"nextHandle": {
																		"dv": 0.85,
																		"dt": 0.08318294975359519
																	}
																},
																{
																	"time": 1.6958200251768314,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
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
											"name": "Smoke_Big_1",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"instSpeed": [
													0,
													0,
													10
												],
												"instSpeed_rand": [
													0,
													0,
													6
												],
												"instAcceleration_rand": [
													-4,
													-4,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"emitType": "Burst",
												"burstParticleCount": 4,
												"instAcceleration": [
													2,
													2,
													0
												],
												"lifeTimeRand": 0.5,
												"warmUpTime": -1.1
											},
											"y": -1.22503,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationY": -10.4,
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
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.28,
																			"value": 0.46078431372549017,
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
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
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"enabled": false,
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67
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
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07237122028132559,
																"dt": -0.5349999999999999
															},
															"nextHandle": {
																"dv": 0.04162030102982175,
																"dt": 0.30767563355153715
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "FloorVapors",
											"x": 2.6292,
											"y": -6.77753,
											"z": -2.61667,
											"scaleX": 12,
											"scaleY": 15,
											"scaleZ": 6,
											"rotationX": 90,
											"rotationY": 136,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_PoisonTrail.png"
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
														"progress": 0.39,
														"saturation": 0.35,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/T_SideMask2.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.5
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
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															-0.25
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
																	"time": 0.443726249597967,
																	"value": 0,
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
																	"time": 1.92,
																	"value": 1.0333333333333334,
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
																	"time": 0.6049999999999998,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028940824188075507,
																		"dt": -0.4999293984746551
																	},
																	"nextHandle": {
																		"dv": -0.0344444444444445,
																		"dt": 0.595
																	}
																},
																{
																	"time": 2.835,
																	"value": 1.0333333333333334,
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
																		"color": -13740786
																	},
																	{
																		"position": 0.37109375,
																		"color": -9267412
																	},
																	{
																		"position": 1,
																		"color": -4467200
																	}
																],
																"resolution": 64
															}
														}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
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
																	"time": 1.0199999999999996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00672021158182709,
																		"dt": -0.49998374168793364
																	},
																	"nextHandle": {
																		"dv": -0.00833333333333336,
																		"dt": 0.6199999999999994
																	}
																},
																{
																	"time": 1.7049999999999996,
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
											"type": "lookAt",
											"name": "lookAt",
											"target": "camera",
											"lockAxis": [
												0,
												1,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": -2,
													"z": -0.00212,
													"scaleX": 4,
													"scaleY": 2,
													"rotationX": 91.3,
													"rotationY": -0.2,
													"rotationZ": 99.9,
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
																	"emissive": 0.2
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.39,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0
																]
															}
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl05u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.25777777777777783,
																			"value": 0.9666666666666667,
																			"mode": 2
																		},
																		{
																			"time": 1.1377777777777778,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.13333333333333308
																			},
																			"nextHandle": {
																				"dv": -1.1974324258329674e-16,
																				"dt": 0.1303703703703704
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.482,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.6833333333333333,
																				"dt": -0.4119999999999999
																			},
																			"nextHandle": {
																				"dv": -0.7333333333333334,
																				"dt": 0.011669411659240847
																			}
																		},
																		{
																			"time": 1.835,
																			"value": 0,
																			"mode": 2
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
																				"position": 0.07421875,
																				"color": -8283567
																			},
																			{
																				"position": 1,
																				"color": -8108
																			}
																		],
																		"resolution": 64
																	}
																}
															}
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.1419204765910052,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.8631878678633056,
																		"dt": -0.41710958732312214
																	},
																	"nextHandle": {
																		"dv": 0.65,
																		"dt": 0.14484172278766527
																	}
																},
																{
																	"time": 1.558060800728585,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "scale.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.14969825436878326,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.379277122761553,
																		"dt": -0.1352157490531156
																	},
																	"nextHandle": {
																		"dv": 1.0166666666666666,
																		"dt": 0.05597636672151013
																	}
																},
																{
																	"time": 0.3302830229508076,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333215,
																		"dt": -0.1304947679987063
																	},
																	"nextHandle": {
																		"dv": -0.025482322604370118,
																		"dt": 0.0999288762356679
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
																"useScale": true,
																"wrap": true,
																"progress": 0.7,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.015,
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
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Distort",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"y": -6,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationX": -90,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap_gradientin",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.75,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
													"name": "DissolveMap_gradientout",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.76,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.535820025176832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.948512879624462,
																"dt": -0.07625464343856375
															},
															"nextHandle": {
																"dv": 0.9666666666666667,
																"dt": 0.024179974823168582
															}
														},
														{
															"time": 1.835820025176832,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.033333333333333215,
																"dt": -0.21082002517683152
															},
															"nextHandle": {
																"dv": -0.01587514615204094,
																"dt": 0.10001342075785845
															}
														}
													]
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
																	"time": 1.3958200251768313,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.9286303273787566,
																		"dt": -0.1277947779219821
																	},
																	"nextHandle": {
																		"dv": 0.9166666666666667,
																		"dt": 0.039179974823168706
																	}
																},
																{
																	"time": 1.525,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666607,
																		"dt": -0.08610045141417322
																	},
																	"nextHandle": {
																		"dv": 0.019299614970643496,
																		"dt": 0.09995920864606948
																	}
																},
																{
																	"time": 3.0100000000000002,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -1.2950000000000004
																	},
																	"nextHandle": {
																		"dv": 0.011275339293792676,
																		"dt": 0.43804693156384644
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.01
													}
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"enabled": false,
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 3,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"burstCount": 2
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
																},
																{
																	"type": "shader",
																	"name": "AutoAlpha",
																	"source": "shaders/AutoAlpha.hx",
																	"enabled": false,
																	"props": {
																		"scale": 2
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
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.28,
																					"value": 0.46078431372549017,
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "width",
																			"enabled": false,
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 0.5
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
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
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
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
																	}
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
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.881032571136126,
																		"dt": -0.26043232281456535
																	},
																	"nextHandle": {
																		"dv": 1.77,
																		"dt": 0.1578968433125152
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"z": 6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Wraith/Anim_Wraith_AttackRange.fbx"
						}
					]
				}
			]
		}
	]
}