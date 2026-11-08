{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"x": 23.75,
			"children": [
				{
					"type": "object",
					"name": "TestFloor4",
					"x": 13.39,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"y": -0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": 0.5,
									"y": 0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": -0.5,
									"y": 0.35
								}
							]
						},
						{
							"type": "object",
							"name": "Pivot",
							"z": 0.15,
							"children": [
								{
									"type": "object",
									"name": "SwordBonus",
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "model",
											"name": "Mesh_BonusMalus",
											"source": "Fx/Stats/Mesh_BonusMalus.fbx",
											"z": -0.1,
											"scaleX": 1.2,
											"scaleY": 1.2,
											"rotationZ": 45,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": true,
														"replace": false,
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/vGrad.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "SwordMalus",
									"enabled": false,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldBonus",
									"enabled": false,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldMalus",
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006181536069364284,
																		"dt": -0.5000166177312422
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 1.348827705383301
																	}
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
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
											"type": "model",
											"name": "Mesh_BonusMalus",
											"source": "Fx/Stats/Mesh_BonusMalus.fbx",
											"z": -0.1,
											"scaleX": 1.2,
											"scaleY": 1.2,
											"rotationZ": 45,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": true,
														"replace": false,
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/vGrad.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										}
									]
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
											"time": 8,
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
					"name": "TestFloor4",
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"y": -0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": 0.5,
									"y": 0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": -0.5,
									"y": 0.35
								}
							]
						},
						{
							"type": "object",
							"name": "Pivot",
							"z": 0.15,
							"children": [
								{
									"type": "object",
									"name": "SwordBonus",
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "SwordMalus",
									"enabled": false,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
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
															0.996078431372549,
															0.19215686274509802,
															0
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
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
															0.996078431372549,
															0.19215686274509802,
															0
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldBonus",
									"enabled": false,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldMalus",
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006181536069364284,
																		"dt": -0.5000166177312422
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 1.348827705383301
																	}
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													],
													"isInstance": true
												}
											]
										}
									]
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
											"time": 8,
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
					"name": "TestFloor4",
					"x": -14.34,
					"visible": false,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"y": -0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": 0.5,
									"y": 0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": -0.5,
									"y": 0.35
								}
							]
						},
						{
							"type": "object",
							"name": "Pivot",
							"z": 0.15,
							"children": [
								{
									"type": "object",
									"name": "SwordBonus",
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword_gradient.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword_gradient.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "SwordMalus",
									"enabled": false,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldBonus",
									"enabled": false,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldMalus",
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield_gradient.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006181536069364284,
																		"dt": -0.5000166177312422
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 1.348827705383301
																	}
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield_gradient.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													],
													"isInstance": true
												}
											]
										}
									]
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
											"time": 8,
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
					"name": "TestFloor4",
					"x": -12.4,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"y": -0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": 0.5,
									"y": 0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": -0.5,
									"y": 0.35
								}
							]
						},
						{
							"type": "object",
							"name": "Pivot",
							"z": 0.15,
							"children": [
								{
									"type": "object",
									"name": "SwordBonus",
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword01.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword01.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword01.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword01.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "model",
											"name": "Mesh_BonusMalus",
											"source": "Fx/Stats/Mesh_BonusMalus.fbx",
											"z": -0.1,
											"scaleX": 1.2,
											"scaleY": 1.2,
											"rotationZ": 45,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": true,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/vGrad.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "SwordMalus",
									"enabled": false,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
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
															0.996078431372549,
															0.19215686274509802,
															0
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldBonus",
									"enabled": false,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldMalus",
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006181536069364284,
																		"dt": -0.5000166177312422
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 1.348827705383301
																	}
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "model",
											"name": "Mesh_BonusMalus",
											"source": "Fx/Stats/Mesh_BonusMalus.fbx",
											"z": -0.1,
											"scaleX": 1.2,
											"scaleY": 1.2,
											"rotationZ": 45,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": true,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/vGrad.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										}
									]
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
											"time": 8,
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
					"name": "TestFloor4",
					"x": -26.11,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"y": -0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": 0.5,
									"y": 0.35
								},
								{
									"type": "model",
									"name": "Male01_AtreideSoldier",
									"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
									"x": -0.5,
									"y": 0.35
								}
							]
						},
						{
							"type": "object",
							"name": "Pivot",
							"z": 0.15,
							"children": [
								{
									"type": "object",
									"name": "SwordBonus",
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "SwordMalus",
									"enabled": false,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleSword06.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldBonus",
									"enabled": false,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
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
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.6745098039215687,
															0.9764705882352941
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield04.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
									"name": "ShieldMalus",
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "Icon01",
											"x": 4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep01",
											"x": 4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": 135,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006181536069364284,
																		"dt": -0.5000166177312422
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 1.348827705383301
																	}
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
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
											"type": "polygon",
											"name": "Icon02",
											"x": -4,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less"
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.19215686274509802,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "ShineSweep02",
											"x": -4,
											"z": 0.05,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationZ": -45,
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
															"depthTest": "Less",
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_CircleShield.png"
													}
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 0.2,
														"width": 0.2,
														"useU": false,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.0068648410245377e-16,
																		"dt": -0.5000307510782702
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 2.321925239562989
																	}
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													],
													"isInstance": true
												}
											]
										}
									]
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
											"time": 8,
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
}