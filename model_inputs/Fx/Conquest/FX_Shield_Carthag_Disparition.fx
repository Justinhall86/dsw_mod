{
	"type": "fx",
	"duration": 1.5,
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"locked": true,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Carthag",
					"scaleZ": 0.9,
					"children": [
						{
							"type": "object",
							"name": "FadeOut",
							"children": [
								{
									"type": "model",
									"name": "Shield_Carthag_lightstart",
									"source": "Fx/Meshes_Common/Shield_Carthag.fbx",
									"scaleX": 7.999999999999998,
									"scaleY": 7.999999999999998,
									"scaleZ": 8,
									"rotationZ": 114.99999999999999,
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
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													1,
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
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 5,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Dissolve_ShieldBase01.png",
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
															"time": 0.11835690840227087,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 0.8579584263526322,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
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
															"time": 0.11835690840227087,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 0.8579584263526322,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
															}
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.34672922967697406,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.37723310945789335,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8338280829210029,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.4197689435407147
															},
															"nextHandle": {
																"dv": 0.009454142840255173,
																"dt": 0.07937111104274033
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Start",
									"scaleX": 71.5,
									"scaleY": 71.5,
									"scaleZ": 71.5,
									"rotationZ": 24.999999999999996,
									"albedoMap": "Fx/Alphas/T_UI_Border_Circle.png",
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
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
															"time": 0.34672922967697406,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.37723310945789335,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8338280829210029,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.4197689435407147
															},
															"nextHandle": {
																"dv": 0.009454142840255173,
																"dt": 0.07937111104274033
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
													0.6274509803921569,
													0.11372549019607843,
													0.11372549019607843
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Shield_CarthagLight",
									"source": "Fx/Meshes_Common/Shield_Carthag.fbx",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 115,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
												"uvShift": [
													0.2,
													0.5
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
												"alpha": 0.3
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5,
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
												"envBlend": 1,
												"envColorSet": false
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
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													1,
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
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 5,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Dissolve_ShieldBase01.png",
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
															"time": 0.11835690840227087,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 0.8579584263526322,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
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
															"time": 0.11835690840227087,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0.32059068147914965,
																"dt": -0.4998246613718933
															},
															"nextHandle": {
																"dv": -0.050458527689237975,
																"dt": 0.271791203701135
															}
														},
														{
															"time": 0.8579584263526322,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09959820801000036,
																"dt": -0.40686319584351727
															},
															"nextHandle": {
																"dv": 0.04878462835569844,
																"dt": 0.19928741889457519
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
													0.6274509803921569,
													0.11372549019607843,
													0.11372549019607843
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_Carthag",
							"source": "Fx/Meshes_Common/Shield_Carthag_straightUV.fbx",
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 115,
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
											"emissive": 3
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap-Pattern",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.94,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 3,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png",
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
										"progress": 0.36,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.2,
											0.5
										],
										"uvShiftSpeed": [
											0,
											0
										]
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
										"bias": 0,
										"scale": 1,
										"power": 1,
										"color": [
											1,
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
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 5,
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
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.11835690840227087,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0.32059068147914965,
														"dt": -0.4998246613718933
													},
													"nextHandle": {
														"dv": -0.050458527689237975,
														"dt": 0.271791203701135
													}
												},
												{
													"time": 0.8579584263526322,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09959820801000036,
														"dt": -0.40686319584351727
													},
													"nextHandle": {
														"dv": 0.04878462835569844,
														"dt": 0.19928741889457519
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
											0.5450980392156862,
											0.5450980392156862
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
								"range": 3,
								"power": 0.8
							}
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.95,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"scaleX": 54.00000000000001,
							"scaleY": 54.00000000000001,
							"scaleZ": 54,
							"rotationZ": 25.00000000000001,
							"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.37723310945789335,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8338280829210029,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.050000000000000044,
														"dt": -0.4197689435407147
													},
													"nextHandle": {
														"dv": 0.009454142840255173,
														"dt": 0.07937111104274033
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
											0.6274509803921569,
											0.11372549019607843,
											0.11372549019607843
										]
									}
								}
							]
						},
						{
							"type": "reference",
							"name": "Prefab_BaseCarthag",
							"source": "Structure/Base/Carthag/Prefab_BaseCarthag.prefab",
							"editorOnly": true
						}
					]
				}
			]
		}
	]
}