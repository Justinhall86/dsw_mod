{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.01,
			"scaleX": 150,
			"scaleY": 150,
			"scaleZ": 150,
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
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_Nuwa",
							"source": "Character/Vernius/Unit/Nuwa/Female01_Nuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Nuwa/Anim_Female01_Nuwa_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/Female01/Nuwa/Anim_Female01_Nuwa_Skill_Loop.fbx",
									"loop": true
								}
							]
						},
						{
							"type": "model",
							"name": "DroneNuwa",
							"source": "Character/Vernius/Unit/Nuwa/DroneNuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_Skill_Loop.fbx",
									"loop": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "01",
					"children": [
						{
							"type": "trails",
							"name": "trails01",
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"rotationX": -53.41070227128864,
							"rotationY": -177.3664572053211,
							"rotationZ": 38.22653866401934,
							"startWidth": 0.4,
							"lifetime": 0.7,
							"minSpeed": 0.00001,
							"maxSpeed": 10000,
							"uvRepeat": "EClamp",
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
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
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
										"alpha": 1,
										"uScale": 3,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
													"mode": 2
												},
												{
													"time": 0.7947330327908322,
													"value": 0,
													"prevHandle": {
														"dv": 1.5147492921937428e-16,
														"dt": -0.2649110109302774
													},
													"nextHandle": {
														"dv": 0.002342879664983477,
														"dt": 0.8357637124293951
													}
												},
												{
													"time": 2,
													"value": 1,
													"prevHandle": {
														"dv": -0.04241000812688278,
														"dt": -0.5162748265523565
													},
													"nextHandle": {
														"dv": 0.035057755242652304,
														"dt": 0.43549402583399405
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
											0.4235294117647059,
											0.2901960784313725,
											1
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
										"progress": 0.63,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keys": [
												{
													"time": 1.2730086494484014,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3441706236411695,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.719747709658555,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10410733261534544
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.15945553476527596
													}
												},
												{
													"time": 1.8739319870762183,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.885792316108346,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0281162644938817,
													"value": 0,
													"prevHandle": {
														"dv": -0.00906637637438279,
														"dt": -0.09092918924631421
													},
													"nextHandle": {
														"dv": -5.616931255453233e-16,
														"dt": 0.5
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 1.8739319870762183,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.885792316108346,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0281162644938817,
													"value": 0,
													"prevHandle": {
														"dv": -0.00906637637438279,
														"dt": -0.09092918924631421
													},
													"nextHandle": {
														"dv": -5.616931255453233e-16,
														"dt": 0.5
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
							"name": "FlashDecals",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
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
															"time": 1.7771675021573905,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.825485811689091,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8672717636187965,
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
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
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
													"colorMask": 255
												}
											}
										},
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
															"time": 1.9692255943204504,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.067855096112028,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.5999563544937745,
															"value": 0,
															"prevHandle": {
																"dv": 0.00929637005809325,
																"dt": -0.3468680139775584
															},
															"nextHandle": {
																"dv": -0.010324520930556134,
																"dt": 0.49992570027449873
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
											"props": {
												"amount": 1,
												"color": [
													0.396078431372549,
													0.23529411764705882,
													0.8549019607843137
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
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
															"time": 1.8450564225970607,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8933747321287613,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.04115622288365,
															"value": 0,
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
											"props": {
												"amount": 1,
												"color": [
													0.996078431372549,
													0.9019607843137255,
													0.8352941176470589
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
													0.6980392156862745,
													0.592156862745098,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.55,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.01",
					"target": ".FXRoot.Chara.DroneNuwa.root.JNT_ROOT_drone.JNT_Drone01"
				}
			]
		}
	]
}