{
	"type": "fx",
	"cullingRadius": 500,
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
					"name": "Tabr",
					"z": 2.280338148148148,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "Start",
							"x": 1.3597577777777778,
							"y": -2.3646933333333333,
							"z": -2.280338148148148,
							"children": [
								{
									"type": "model",
									"name": "Shield_Tabr_grow",
									"source": "Fx/Meshes_Common/Shield_Tabr.fbx",
									"scaleX": 240,
									"scaleY": 240,
									"scaleZ": 240,
									"rotationZ": -163.7,
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
												"alpha": 0.75,
												"uScale": 3.5,
												"vScale": 4,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/Hextile_hex02-Both.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.37723310945789335,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.014545454545454528
															}
														},
														{
															"time": 0.9960108982937392,
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
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.37723310945789335,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.014545454545454528
													}
												},
												{
													"time": 0.9954863554457984,
													"value": 1.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.07920085175008922
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07920085175008922
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
													1,
													0.7686274509803921,
													0.5450980392156862
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Shield_Tabr_lightstart",
									"source": "Fx/Meshes_Common/Shield_Tabr.fbx",
									"scaleX": 235,
									"scaleY": 235,
									"scaleZ": 235,
									"rotationZ": -163.7,
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
									"x": 0.18567,
									"y": 0.56615,
									"z": 2.28034,
									"scaleX": 86,
									"scaleY": 86,
									"scaleZ": 86,
									"rotationZ": 24.999999999999993,
									"albedoMap": "Fx/Alphas/T_TabrBorder.png",
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
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
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.4949999999999999,
													"value": 0.01,
													"mode": 0,
													"prevHandle": {
														"dv": 0.004397321428571419,
														"dt": -1.0511728395061728
													},
													"nextHandle": {
														"dv": -0.0007187892533181729,
														"dt": 0.1671095069447516
													}
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0,
													"mode": 0
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.108812082635248,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 3.651914045064065e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.10625000000000007,
																"dt": 0.3044293098446826
															}
														},
														{
															"time": 0.37778577004822056,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6907733335833159,
															"value": 0.011458333333333404,
															"mode": 0,
															"prevHandle": {
																"dv": -0.021875000000000033,
																"dt": -0.3814535930583975
															},
															"nextHandle": {
																"dv": 0.008786986968611759,
																"dt": 0.15322641148956903
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
													0.5372549019607843,
													0
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_Tabr",
							"source": "Fx/Meshes_Common/Shield_Tabr.fbx",
							"x": 1.3597577777777778,
							"y": -2.3646933333333333,
							"z": -2.280338148148148,
							"scaleX": 235,
							"scaleY": 235,
							"scaleZ": 235,
							"rotationZ": -163.7,
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
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.75,
										"uScale": 3.5,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.35878787878787877,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.055919978022575645,
														"dt": 0.06909090909090909
													}
												},
												{
													"time": 0.4509090909090909,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.8569696969696969,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.055919978022575645,
														"dt": -0.4121212121212121
													},
													"nextHandle": {
														"dv": -0.055919978022575645,
														"dt": 0.4121212121212121
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
										"progress": 0.42,
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.5,
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
											0.7686274509803921,
											0.5450980392156862
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_TabrLight",
							"source": "Fx/Meshes_Common/Shield_Tabr.fbx",
							"x": 1.3597577777777778,
							"y": -2.3646933333333333,
							"z": -2.280338148148148,
							"scaleX": 235,
							"scaleY": 235,
							"scaleZ": 235,
							"rotationZ": -163.7,
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
										"alpha": 0.5
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
													"time": 0.8727718889164171,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.014545454545454528
													}
												},
												{
													"time": 1.491549677752263,
													"value": 1,
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
											1,
											0.5372549019607843,
											0
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_TabrBlue",
							"source": "Fx/Meshes_Common/Shield_Tabr.fbx",
							"x": 1.3597577777777778,
							"y": -2.3646933333333333,
							"z": -2.280338148148148,
							"scaleX": 235,
							"scaleY": 235,
							"scaleZ": 235,
							"rotationZ": -163.7,
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
										"alpha": 0.75,
										"uScale": 3.5,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.8512443835961077,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8612443835961079,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9830180080162738,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9930180080162738,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1857466609703748,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7019607843137254,
											0.8,
											1
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
													"time": 0.8727718889164171,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.014545454545454528
													}
												},
												{
													"time": 1.491549677752263,
													"value": 1,
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
									"type": "curve",
									"name": "position.x",
									"loop": true,
									"keys": [
										{
											"time": 0.8679917361388516,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8779917361388518,
											"value": 2.5116133599242345,
											"mode": 2
										},
										{
											"time": 0.9758364051178805,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9830180080162738,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9930180080162738,
											"value": 2.5116133599242345,
											"mode": 2
										},
										{
											"time": 1.1857466609703748,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.1957466609703749,
											"value": 2.5116133599242345,
											"mode": 2
										},
										{
											"time": 1.3917515636305047,
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 2,
								"power": 0.8
							}
						},
						{
							"type": "reference",
							"name": "Prefab_SietchTabr",
							"source": "Structure/Base/SietchTabr/Prefab_SietchTabr.prefab",
							"editorOnly": true,
							"locked": true,
							"x": -0.3885022222222222,
							"y": 0.6756266666666666,
							"z": -2.480338148148148
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
							"x": 1.32156,
							"y": -1.86977,
							"z": 2.28034,
							"scaleX": 86,
							"scaleY": 86,
							"scaleZ": 86,
							"rotationZ": 24.999999999999993,
							"albedoMap": "Fx/Alphas/T_TabrBorder01.png",
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
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
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.108812082635248,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 3.651914045064065e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.10625000000000007,
														"dt": 0.3044293098446826
													}
												},
												{
													"time": 0.37778577004822056,
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
											0.5372549019607843,
											0
										]
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