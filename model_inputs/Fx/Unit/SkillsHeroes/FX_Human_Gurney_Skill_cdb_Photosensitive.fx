{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
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
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "object",
					"name": "Nefud",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_AtreidesGurney",
							"source": "Character/Atreide/Unit/Gurney/Male01_AtreidesGurney.fbx",
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Gurney/Anim_Male01_Gurney_Skill.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "GurneySet_Shield",
							"source": "Character/Atreide/Unit/Weapons/GurneySet_Shield.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "GurneySet_Javelin",
							"source": "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
							"x": 0.04935,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Nefud.GurneySet_Javelin",
							"target": "FXAnimation.FXRoot.Nefud.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Nefud.GurneySet_Shield",
							"target": "FXAnimation.FXRoot.Nefud.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
						}
					]
				},
				{
					"type": "object",
					"name": "Skill",
					"scaleX": 0.72,
					"scaleY": 0.72,
					"scaleZ": 0.72,
					"children": [
						{
							"type": "object",
							"name": "Impact",
							"x": 2.21954,
							"y": 0.11437,
							"z": 0.05893,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
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
											1.3
										],
										"lifeTime": 0.35,
										"lifeTimeRand": 0.1,
										"warmUpTime": -1.45,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.3
										],
										"instScale": 3.8,
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
															"emissive": 10
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
														"uScale": 7,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_FlatFlash.png"
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2196078431372549,
															0.9176470588235294,
															0.4823529411764706
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
										"warmUpTime": -0.5,
										"lifeTime": 1.5,
										"instScale": 0.6,
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
														"texture": "Fx/Alphas/T_FlatImpact.png"
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
															0.2196078431372549,
															0.9176470588235294,
															0.4823529411764706
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
								},
								{
									"type": "model",
									"name": "Knee",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.3445,
									"y": -0.01928,
									"z": 3.70886,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.5,
									"rotationY": 175,
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
															"time": 0.9569214434097999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4566899697154054,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.541545696106594,
															"value": 2,
															"mode": 2
														},
														{
															"time": 1.64149671509102,
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
															"time": 0.9648956035950667,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.90409167658403,
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
															"time": 1.3359491445894558,
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
															"time": 1.498746745453906,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8072896989041016,
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
															"time": 1.5285769607752242,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8341245312767893,
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
													0.6666666666666666,
													1,
													0.7686274509803921
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.8427967405168735,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.9227967405168735,
															"value": 0.2,
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
							"name": "FlashDecals",
							"enabled": false,
							"x": 1.25861,
							"y": 0.05341,
							"z": 1.21359,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": -0.04141,
									"z": 1.22656,
									"scaleX": 5,
									"scaleY": 4,
									"scaleZ": 4,
									"rotationY": 89.99999999999999,
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
															"time": 0.5340051808957428,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5440051808957428,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6307306445168033,
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
									"name": "advancedDecal_Green",
									"x": -0.16694,
									"z": 1.26957,
									"scaleX": 4.5,
									"scaleY": 3.5,
									"scaleZ": 3,
									"rotationY": 90,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6236601604915842,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.670556022532212,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4651543152009034,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.09999999999999998,
																"dt": -0.288834637896635
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
															}
														},
														{
															"time": 1.5190527321040586,
															"value": 1,
															"mode": 1
														},
														{
															"time": 1.8340736608130257,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.09336206410417613
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.09336206410417613
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.6236601604915842,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.670556022532212,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3961401139682952,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.09999999999999998,
																"dt": -0.288834637896635
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
															}
														},
														{
															"time": 1.4625751319009215,
															"value": 1,
															"mode": 1
														},
														{
															"time": 2.4035211902142013,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.7486377477716366
															},
															"nextHandle": {
																"dv": 0.0020784078066128395,
																"dt": 0.09335847235761878
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
													0.6666666666666666,
													1,
													0.7686274509803921
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "flare",
							"enabled": false,
							"x": 1.18667,
							"y": 0.07659,
							"z": 5.07222,
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
											20,
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
										"warmUpTime": -0.6,
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
										"warmUpTime": -0.65,
										"emitType": "Burst",
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
															0.6666666666666666,
															1,
															0.7686274509803921
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
															1,
															1
														]
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
						},
						{
							"type": "object",
							"name": "Flare",
							"x": 1.11298,
							"z": 2.59442,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_FlarePartition",
									"z": 8.56452,
									"scaleY": 4,
									"rotationY": -180,
									"rotationZ": 112.0223446799488,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.02221,
											"z": -1.04827,
											"scaleX": 1.13,
											"scaleY": 20,
											"scaleZ": 1.13,
											"rotationX": -90,
											"rotationZ": -90,
											"kind": 0,
											"args": [
												100
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
															"emissive": 4
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
														"vScale": 2.5,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Music_Partition.png",
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.02
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
																	"time": 0.5066144049601181,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.07547152222066854,
																		"dt": -0.4999305700197999
																	},
																	"nextHandle": {
																		"dv": 0.03333333333333333,
																		"dt": 0.22203609901920762
																	}
																},
																{
																	"time": 0.8221536339522704,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.685415862069097,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.19,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.02
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
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0.65
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 50,
														"power": 0.8
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
														"texScaleX": 3,
														"texScaleY": 3,
														"tex": "Fx/Gradients/Cyl05u_A.jpg",
														"intensity": 5,
														"scrollSpeed": [
															0,
															0.5
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt_FlareRibbon",
									"z": 8.56452,
									"scaleY": 4,
									"rotationY": -180,
									"rotationZ": 112.0223446799488,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.02221,
											"z": -1.04827,
											"scaleX": 1.13,
											"scaleY": 20,
											"scaleZ": 1.13,
											"rotationX": -90,
											"rotationZ": -90,
											"kind": 0,
											"args": [
												100
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
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 2.5,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Music_Partition_06.png",
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.02
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
																	"time": 0.5066144049601181,
																	"value": 0,
																	"prevHandle": {
																		"dv": 2.773163824848552e-16,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.2367563112208102
																	}
																},
																{
																	"time": 0.8221536339522704,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.685415862069097,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.24,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.02
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
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0.65
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 50,
														"power": 0.8
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
														"texScaleX": 3,
														"texScaleY": 3,
														"tex": "Fx/Gradients/Cyl05u_A.jpg",
														"intensity": 5,
														"scrollSpeed": [
															0,
															0.5
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt_FlareLarge",
									"enabled": false,
									"x": -5.551115123125783e-17,
									"z": 1.4117100000000011,
									"scaleY": 1.1,
									"rotationZ": 14.099900134311168,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 6,
											"scaleY": 40,
											"scaleZ": 2.05,
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
														"alpha": 0.3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
																	"time": 0.5503903254866931,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.740390325486693,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
																	}
																},
																{
																	"time": 1.521462947258485,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3339427824508911
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3339427824508911
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
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.65,
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
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 2
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
																		"color": -151464545
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
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6431372549019607,
															0.5019607843137255,
															0.28627450980392155
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2545976210034451,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5699212363686412,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.00757687696833834,
																		"dt": -0.06406311509621984
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 0.28150569319861213
																	}
																},
																{
																	"time": 1.2587866163647736,
																	"value": 1
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.5490196078431373,
											1,
											0.6039215686274509
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.4618921752096777,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2350916509493346,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25773315857988566
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25773315857988566
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
							"name": "Decals",
							"scaleX": 2.1,
							"scaleY": 2.1,
							"scaleZ": 2.1,
							"children": [
								{
									"type": "object",
									"name": "PartitionOnde",
									"scaleX": 0.95,
									"scaleY": 0.95,
									"scaleZ": 0.95,
									"children": [
										{
											"type": "polygon",
											"name": "Ribbon",
											"scaleX": 12.000000000000002,
											"scaleY": 12.000000000000002,
											"kind": 1,
											"args": [
												48,
												360,
												0.6,
												4
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
															"colorMask": 255
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
														"alpha": 0.3,
														"uScale": 7,
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
															0.5490196078431373,
															1,
															0.6862745098039216
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 7,
														"texScaleY": 7,
														"tex": "Fx/Gradients/Cyl05v_A01.png",
														"intensity": 1.5,
														"scrollSpeed": [
															0.5,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "partition",
											"scaleX": 12.000000000000002,
											"scaleY": 12.000000000000002,
											"kind": 1,
											"args": [
												48,
												360,
												0.6,
												4
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
														"alpha": 7,
														"uScale": 5,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_01.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															1,
															0.6862745098039216
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
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
														"intensity": 1.5,
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
												"alpha": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3246071049607515,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1439383990187952,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.5626732983290179
															},
															"nextHandle": {
																"dv": 0.014473662997169512,
																"dt": 0.244318310925603
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3246071049607515,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1439383990187952,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.5626732983290179
															},
															"nextHandle": {
																"dv": 0.014473662997169512,
																"dt": 0.244318310925603
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
															"time": 1.5417792551930039,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.581265100689777,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1439383990187952,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.5626732983290179
															},
															"nextHandle": {
																"dv": 0.014473662997169512,
																"dt": 0.244318310925603
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
													"time": 1.4928441023150145,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.8453977148184662,
													"value": 1,
													"prevHandle": {
														"dv": -0.016507093038543363,
														"dt": -0.3511598057350942
													},
													"nextHandle": {
														"dv": 0.016507093038543363,
														"dt": 0.3511598057350942
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Inside",
									"enabled": false,
									"z": 0.17653444444444444,
									"scaleX": 30,
									"scaleY": 30,
									"scaleZ": 2.13,
									"albedoMap": "Fx/Gradients/circGrad3.jpg",
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4561719347063484,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4995441429106888,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.042231014460139,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.41,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.001
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Duration",
									"children": [
										{
											"type": "object",
											"name": "Partition",
											"scaleX": 0.95,
											"scaleY": 0.95,
											"scaleZ": 0.95,
											"children": [
												{
													"type": "polygon",
													"name": "Ribbon",
													"scaleX": 12.000000000000002,
													"scaleY": 12.000000000000002,
													"kind": 1,
													"args": [
														48,
														360,
														0.6,
														4
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
																	"colorMask": 255
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
																"alpha": 0.3,
																"uScale": 7,
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
																	0.5490196078431373,
																	1,
																	0.6862745098039216
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
																"progress": 0.82,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.25,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.07,
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
																"texScaleX": 7,
																"texScaleY": 7,
																"tex": "Fx/Gradients/Cyl05v_A01.png",
																"intensity": 1.5,
																"scrollSpeed": [
																	0.5,
																	0
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "partition",
													"scaleX": 12.000000000000002,
													"scaleY": 12.000000000000002,
													"kind": 1,
													"args": [
														48,
														360,
														0.6,
														4
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
																	"colorMask": 255
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
																"uScale": 7,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0.25,
																"texture": "Fx/Alphas/T_Music_Partition_01.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	1,
																	0.6862745098039216
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 2
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
																"intensity": 1.5,
																"scrollSpeed": [
																	0.5,
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
																"progress": 0.9,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.25,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.07,
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
											"enabled": false,
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
														"alpha": 0.3
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
																	"time": 1.5089766210055482,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
															0.5019607843137255,
															0.6235294117647059,
															0.24705882352941178
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_border",
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
														"alpha": 0.8
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
																	"time": 1.5089766210055482,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
															0.4784313725490196,
															0.611764705882353,
															0.19215686274509802
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
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
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															1,
															1,
															1,
															0
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															1,
															0.6862745098039216
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 1.5089766210055482,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.7690028320613407,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
														"alpha": 0.25
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.5089766210055482,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
															0.00392156862745098,
															0.5529411764705883,
															0.1843137254901961
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.5,
														"maxAlpha": 1,
														"frequency": 0.5
													}
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.5089766210055482,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0100000000000002,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3350000000000002
															},
															"nextHandle": {
																"dv": -1.8417475812501703e-16,
																"dt": 0.22558515433173873
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
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"enabled": false,
							"scaleX": 2.1,
							"scaleY": 2.1,
							"scaleZ": 2.1,
							"children": [
								{
									"type": "object",
									"name": "PartitionOnde",
									"z": 0.05,
									"children": [
										{
											"type": "polygon",
											"name": "Ribbon",
											"scaleX": 12.000000000000002,
											"scaleY": 12.000000000000002,
											"kind": 1,
											"args": [
												48,
												360,
												0.52,
												6
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
															"colorMask": 255
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
														"alpha": 0.3,
														"uScale": 5,
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
															0.5490196078431373,
															1,
															0.6862745098039216
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 7,
														"texScaleY": 7,
														"tex": "Fx/Gradients/Cyl05v_A01.png",
														"intensity": 3,
														"scrollSpeed": [
															0.5,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "partition",
											"scaleX": 12.000000000000002,
											"scaleY": 12.000000000000002,
											"kind": 1,
											"args": [
												48,
												360,
												0.52,
												6
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
														"uScale": 5,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_01.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															1,
															0.6862745098039216
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
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
														"intensity": 3,
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
												"alpha": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3246071049607515,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1439383990187952,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.5626732983290179
															},
															"nextHandle": {
																"dv": 0.014473662997169512,
																"dt": 0.244318310925603
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3246071049607515,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1439383990187952,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.5626732983290179
															},
															"nextHandle": {
																"dv": 0.014473662997169512,
																"dt": 0.244318310925603
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
															"time": 1.5417792551930039,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.581265100689777,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1439383990187952,
															"value": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.5626732983290179
															},
															"nextHandle": {
																"dv": 0.014473662997169512,
																"dt": 0.244318310925603
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
													"time": 1.4928441023150145,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.8453977148184662,
													"value": 1,
													"prevHandle": {
														"dv": -0.016507093038543363,
														"dt": -0.3511598057350942
													},
													"nextHandle": {
														"dv": 0.016507093038543363,
														"dt": 0.3511598057350942
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Inside",
									"z": 0.17653444444444444,
									"scaleX": 30,
									"scaleY": 30,
									"scaleZ": 2.13,
									"albedoMap": "Fx/Gradients/circGrad3.jpg",
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4561719347063484,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4995441429106888,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.042231014460139,
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
													0.5490196078431373,
													1,
													0.6862745098039216
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.41,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.001
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Duration",
									"children": [
										{
											"type": "object",
											"name": "Partition",
											"z": 0.05,
											"children": [
												{
													"type": "polygon",
													"name": "Ribbon",
													"scaleX": 12.000000000000002,
													"scaleY": 12.000000000000002,
													"kind": 1,
													"args": [
														48,
														360,
														0.52,
														6
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
																	"colorMask": 255
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
																"alpha": 0.3,
																"uScale": 5,
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
																	0.5490196078431373,
																	1,
																	0.6862745098039216
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
																"progress": 0.82,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.25,
																"texture": "Fx/noise/Water_01.png",
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
															"name": "VertexDisplacement",
															"source": "shaders/VertexDisplacement.hx",
															"props": {
																"X": true,
																"Y": true,
																"Z": true,
																"texScaleX": 7,
																"texScaleY": 7,
																"tex": "Fx/Gradients/Cyl05v_A01.png",
																"intensity": 3,
																"scrollSpeed": [
																	0.5,
																	0
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "partition",
													"scaleX": 12.000000000000002,
													"scaleY": 12.000000000000002,
													"kind": 1,
													"args": [
														48,
														360,
														0.52,
														6
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
																"uScale": 5,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0.25,
																"texture": "Fx/Alphas/T_Music_Partition_01.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5490196078431373,
																	1,
																	0.6862745098039216
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 2
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
																"intensity": 3,
																"scrollSpeed": [
																	0.5,
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
																"progress": 0.9,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.25,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
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
														"alpha": 0.75
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5705907717334981,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
																	"time": 1.5089766210055482,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.7690028320613407,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
															0.5019607843137255,
															0.6235294117647059,
															0.24705882352941178
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_border",
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
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5705907717334981,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
																	"time": 1.5089766210055482,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.7690028320613407,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
															0.4784313725490196,
															0.611764705882353,
															0.19215686274509802
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
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															1,
															1,
															1,
															0
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															1,
															0.6862745098039216
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 1.5089766210055482,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.7690028320613407,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
											"type": "advancedDecal",
											"name": "advancedDecal_glow",
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
														"alpha": 0.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 1.5089766210055482,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.7690028320613407,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.1857320840007644,
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
															0.00392156862745098,
															0.5529411764705883,
															0.1843137254901961
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.5089766210055482,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0100000000000002,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3350000000000002
															},
															"nextHandle": {
																"dv": -1.8417475812501703e-16,
																"dt": 0.22558515433173873
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
			]
		}
	]
}