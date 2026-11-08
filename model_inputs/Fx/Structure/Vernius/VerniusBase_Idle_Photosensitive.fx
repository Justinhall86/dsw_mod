{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 140,
			"rotationZ": 180,
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
					"type": "model",
					"name": "VerniusBase",
					"source": "Structure/Base/Vernius/VerniusBase.fbx",
					"editorOnly": true
				},
				{
					"type": "object",
					"name": "BaseIdle",
					"x": -1.33827,
					"y": 5.81533,
					"z": 0.15,
					"scaleX": 0.55,
					"scaleY": 0.55,
					"scaleZ": 0.55,
					"rotationZ": -179.4,
					"children": [
						{
							"type": "object",
							"name": "Lights",
							"x": 0.07334,
							"y": 0.33092666666666615,
							"z": 14.290090000000001,
							"rotationZ": 9.93923337957349e-17,
							"children": [
								{
									"type": "model",
									"name": "ViernusBaseLights",
									"source": "Fx/Meshes_Common/ViernusBaseLights.fbx",
									"x": 0.02416999999999997,
									"y": -0.08202666666666669,
									"z": -12.055380000000005,
									"scaleX": 1.8300000000000003,
									"scaleY": 1.8300000000000003,
									"scaleZ": 1.8300000000000003,
									"rotationZ": -90.5,
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
													"emissive": 5
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
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 150,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle.png",
												"uvShift": [
													0,
													0.05
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 0.42578125,
																"color": -1
															},
															{
																"position": 0.63671875,
																"color": -1
															},
															{
																"position": 1,
																"color": -16777216
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												},
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.15,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Triangle",
									"enabled": false,
									"x": -0.04833999999999991,
									"y": 0.16405333333333294,
									"z": 24.110760000000006,
									"scaleX": 2.5000000000000004,
									"scaleY": 2.5000000000000004,
									"scaleZ": 2.5,
									"rotationX": 0.9999999999999996,
									"rotationY": 2.2069531490250796e-32,
									"rotationZ": -1.2722218725854065e-14,
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
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Triangle_128.png"
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
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
											0.33725490196078434,
											0.27058823529411763,
											0.984313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "object",
							"name": "ElectricPolls_Left",
							"z": 22.4813,
							"rotationZ": -43.4,
							"children": [
								{
									"type": "subFX",
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity_Photosensitive.fx",
									"x": 9.70082,
									"y": 42.28597,
									"z": -9.30836,
									"rotationX": 31.4,
									"rotationZ": 169,
									"time": 0.69056
								},
								{
									"type": "subFX",
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity_Photosensitive.fx",
									"x": -0.23514,
									"y": 43.89258,
									"z": -9.23648,
									"rotationX": 0.4,
									"rotationY": 6.3,
									"rotationZ": -2.6,
									"time": 0.69056
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "object",
									"name": "Poteau_lights",
									"x": 4.50834,
									"y": 40.35547,
									"z": -8.96223,
									"rotationX": 1.9,
									"children": [
										{
											"type": "polygon",
											"name": "lightPOTO",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
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
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.1
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "lightPOTO_leds",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
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
															"emissive": 5
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
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 15,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle.png",
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
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
														"progress": 0.75,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.5,
															0
														]
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
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
							"name": "ElectricPolls_Middle",
							"z": 22.4813,
							"rotationZ": 6.3,
							"children": [
								{
									"type": "subFX",
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity_Photosensitive.fx",
									"x": 9.70082,
									"y": 42.28597,
									"z": -9.30836,
									"rotationX": 31.4,
									"rotationZ": 169,
									"time": 6.300179978339948
								},
								{
									"type": "subFX",
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity_Photosensitive.fx",
									"x": -0.23514,
									"y": 43.89258,
									"z": -9.23648,
									"rotationX": 0.4,
									"rotationY": 6.3,
									"rotationZ": -2.6,
									"time": 6.305179978339948
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "object",
									"name": "Poteau_lights",
									"x": 4.57792,
									"y": 40.39927,
									"z": -8.96078,
									"rotationX": 1.9,
									"children": [
										{
											"type": "polygon",
											"name": "lightPOTO",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
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
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.1
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "lightPOTO_leds",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
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
															"emissive": 5
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
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 15,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle.png",
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
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
														"progress": 0.75,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.5,
															0
														]
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
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
							"name": "ElectricPolls_Right",
							"z": 22.4813,
							"rotationZ": 56,
							"children": [
								{
									"type": "subFX",
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity_Photosensitive.fx",
									"x": 9.67568,
									"y": 42.15663,
									"z": -9.22793,
									"rotationX": 31.4,
									"rotationZ": 169,
									"time": 2.410343017578124
								},
								{
									"type": "subFX",
									"name": "VerniusBase_FilamentElectricity",
									"source": "Fx/Structure/Vernius/VerniusBase_FilamentElectricity_Photosensitive.fx",
									"x": -0.23665,
									"y": 43.65281,
									"z": -9.15188,
									"rotationX": 0.6,
									"rotationY": 8.4,
									"rotationZ": -2.6,
									"time": 2.410343017578124
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "object",
									"name": "Poteau_lights",
									"x": 4.57792,
									"y": 40.26136,
									"z": -8.96535,
									"rotationX": 1.9,
									"children": [
										{
											"type": "polygon",
											"name": "lightPOTO",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
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
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.1
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "lightPOTO_leds",
											"x": 0.43149,
											"y": 1.06006,
											"z": 1.75364,
											"scaleX": 6.6,
											"scaleY": 0.5,
											"scaleZ": 3,
											"rotationY": -62.1,
											"rotationZ": 83.4,
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
															"emissive": 5
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
														"useScale": true,
														"wrap": true,
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 15,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T_circle.png",
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
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
														"progress": 0.75,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.5,
															0
														]
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter_Slide",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 40,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2.6,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 1,
								"animationBlendBetweenFrames": false,
								"emitRate": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
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
							"z": 0.22314,
							"scaleX": 12.5,
							"scaleY": 12.5,
							"scaleZ": 1.75,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"emissive": 5
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
												"texture": "Fx/noise/clouds3.png",
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
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
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
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
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
									"type": "curve",
									"name": "position.z",
									"keys": [
										{
											"time": 0.1,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6666666666666666
											}
										},
										{
											"time": 2,
											"value": 30,
											"mode": 2
										}
									],
									"loop": true
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.5,
											"prevHandle": {
												"dv": -0.005283080514001015,
												"dt": -0.501902278083384
											},
											"nextHandle": {
												"dv": 0.009336519767737972,
												"dt": 1.3133880651343448
											}
										},
										{
											"time": 2,
											"value": 0.7,
											"prevHandle": {
												"dv": -0.00734484572083538,
												"dt": -0.8697258596569748
											},
											"nextHandle": {
												"dv": 0.0043858030696355705,
												"dt": 0.4999911425256196
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "OrbitalDrones",
							"z": 7.60492,
							"children": [
								{
									"type": "object",
									"name": "Bottom",
									"z": -0.01427,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"children": [
										{
											"type": "emitter",
											"name": "OrbitalDrones",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 2.4,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.7,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 1.3,
												"emitOrientation": "Speed",
												"emitRate": 8,
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 8,
												"instScale": 6,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"lifeTimeRand": 800000,
												"emitSurface": true,
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
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 3.76,
											"children": [
												{
													"type": "model",
													"name": "SM_Drone01",
													"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
													"scaleX": 0.12,
													"scaleY": 0.12,
													"scaleZ": 0.12
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.10588235294117647,
															0.09019607843137255,
															0.12156862745098039
														]
													}
												}
											]
										},
										{
											"type": "emitter",
											"name": "OrbitalDrones_lights",
											"enabled": false,
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 0.06,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.7,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 1.3,
												"emitOrientation": "Speed",
												"emitRate": 8,
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 8,
												"instScale": 0.18,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"instOffset": [
													0,
													0,
													0.4
												],
												"instOffset_rand": [
													0,
													0,
													0
												],
												"lifeTimeRand": 800000,
												"emitSurface": true,
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
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 3.8,
											"children": [
												{
													"type": "polygon",
													"name": "top",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": 1,
													"rotationZ": 180,
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
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_ChocWave_Contrast02.png"
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
																				"position": 0.48828125,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
												}
											]
										},
										{
											"type": "emitter",
											"name": "OrbitalDrones ui",
											"enabled": false,
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 0.24,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.7,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 1.3,
												"emitOrientation": "Speed",
												"emitRate": 8,
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 8,
												"instScale": 0.7,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"lifeTimeRand": 800000,
												"alignMode": "Screen",
												"instOffset": [
													0,
													-0.2,
													0
												],
												"emitSurface": true,
												"randomColor1": [
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196,
													1
												],
												"randomColor2": [
													0.27058823529411763,
													0.984313725490196,
													0.8235294117647058,
													1
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
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 3.75,
											"children": [
												{
													"type": "polygon",
													"name": "top",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": 1,
													"rotationZ": 180,
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
																	"emissive": 6
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
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Ping_Cursor06-1.png"
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 7.778746732779829e-8,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.6306832013632634e-7,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.549092385455104e-7,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3.4675015695469453e-7,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 4.295709851629767e-7,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 5.148518379715048e-7,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.0000012960420341069413,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.0000014022140221402214,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0000015202952029520295,
																			"value": 0.75,
																			"mode": 2
																		},
																		{
																			"time": 0.0000017859778597785977,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -7.38007380073801e-8
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 7.527675276752766e-7
																			}
																		},
																		{
																			"time": 0.000004,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
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
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Tower",
									"z": 13.095469999999999,
									"children": [
										{
											"type": "emitter",
											"name": "OrbitalDrones",
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 2.4,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.4,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 0.75,
												"emitOrientation": "Speed",
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 5,
												"instScale": 6,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"emitSurface": true,
												"lifeTimeRand": 800000,
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
											"scaleX": 45,
											"scaleY": 45,
											"scaleZ": 22.5,
											"children": [
												{
													"type": "model",
													"name": "SM_Drone01",
													"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.10588235294117647,
																	0.09019607843137255,
																	0.12156862745098039
																]
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "OrbitalDrones_lights",
											"enabled": false,
											"props": {
												"emitShape": "Cylinder",
												"instScale_rand": 0.06,
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"emitRad2": 0.4,
												"lifeTime": 1000000,
												"instOrbitSpeed_rand": [
													0,
													0,
													0.4
												],
												"emitRad1": 0.75,
												"emitOrientation": "Speed",
												"simulationSpace": "World",
												"alignAxis": [
													10,
													0,
													0
												],
												"instRotation": [
													0,
													0,
													180
												],
												"maxCount": 5,
												"instScale": 0.18,
												"speedFactor": 0.7,
												"emitAngle": 360,
												"emitSurface": true,
												"instOffset": [
													0,
													0,
													0.4
												],
												"lifeTimeRand": 800000,
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
											"scaleX": 45,
											"scaleY": 45,
											"scaleZ": 22.5,
											"children": [
												{
													"type": "polygon",
													"name": "top",
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": 1,
													"rotationZ": 180,
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
																	"emissive": 3
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
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/circGrad05.jpg"
															}
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
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_ChocWave_Contrast02.png"
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
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"enabled": false,
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 5.806941581388243e-7,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.0000012960420341069413,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.000002,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.002121688701488038,
																				"dt": -2.6004577474840324e-7
																			},
																			"nextHandle": {
																				"dv": -0.007168580718800515,
																				"dt": 4.999489873997548e-7
																			}
																		},
																		{
																			"time": 0.000004,
																			"value": 0,
																			"mode": 2
																		}
																	],
																	"loop": true
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
																				"position": 0.48828125,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Viernus_CentralTower",
							"source": "Fx/Meshes_Common/Viernus_CentralTower.fbx",
							"enabled": false,
							"z": -17.34292,
							"scaleX": 1.9,
							"scaleY": 1.9,
							"scaleZ": 2.2,
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
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/Gradients/Cyl16u_A.png",
										"uvShift": [
											0,
											0.05
										],
										"uvShiftSpeed": [
											0,
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
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/clouds_Dissolve.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
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
										"range": 1,
										"power": 0.8
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
														"color": -15727340
													},
													{
														"position": 0.5390625,
														"color": -12444212
													},
													{
														"position": 1,
														"color": -13421
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
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.05,
										"scale": 0.65,
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
									"name": "UVSweep",
									"source": "shaders/UVSweep.hx",
									"props": {
										"saturation": 0.42,
										"width": 1,
										"useU": false,
										"progress": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.1,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/Water_03.png",
										"directionalNoise": false,
										"intensity": 0.2,
										"scrollSpeed": [
											0,
											0
										],
										"scale": [
											1,
											2
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderStraight_mult",
							"source": "Fx/Meshes_Common/CylinderStraight.fbx",
							"enabled": false,
							"x": 0.31762,
							"y": 29.58665,
							"z": 4.73512,
							"scaleX": 0.55,
							"scaleY": 0.55,
							"scaleZ": 7,
							"rotationX": 90,
							"rotationY": 180,
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
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
										"uvScaleX": 0.5,
										"uvScaleY": 3,
										"texture": "Fx/Alphas/T_circle3.png",
										"uvShift": [
											0.25,
											0
										],
										"uvShiftSpeed": [
											0,
											0.75
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
														"color": -13754522
													},
													{
														"position": 0.65625,
														"color": -12444212
													},
													{
														"position": 1,
														"color": -9154057
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
							"type": "model",
							"name": "CylinderStraight-InOut",
							"source": "Fx/Meshes_Common/CylinderStraight.fbx",
							"x": 0.31762,
							"y": 29.58665,
							"z": 4.73512,
							"scaleX": 0.55,
							"scaleY": 0.55,
							"scaleZ": 7,
							"rotationX": 90,
							"rotationY": 180,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.76,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0.1,
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
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0.15234375,
														"color": -13754522
													},
													{
														"position": 0.59375,
														"color": -9757236
													},
													{
														"position": 1,
														"color": -74613
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
										"alpha": 0.5
									}
								}
							]
						},
						{
							"type": "object",
							"name": "PatternLights02",
							"enabled": false,
							"x": -0.15240999999999927,
							"y": 1.9558199999999974,
							"z": 3.1866499999999984,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"rotationZ": 9.939233379573491e-17,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": -8.881784197001252e-16,
									"z": 1.3322676295501878e-15,
									"scaleX": 75.20000000000003,
									"scaleY": 75.20000000000003,
									"scaleZ": 75.20000000000003,
									"rotationZ": -1.691784405033785e-16,
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase07.png",
												"uvShift": [
													0,
													0.05
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
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
																"color": -13754522
															},
															{
																"position": 0.30859375,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -4033215
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"x": -1.3322676295501878e-15,
									"y": 1.7763568394002505e-15,
									"z": 4.440892098500626e-16,
									"scaleX": 75.2,
									"scaleY": 75.2,
									"scaleZ": 75.19999999999996,
									"rotationZ": 2.5376766075506784e-16,
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase07.png",
												"uvShift": [
													0,
													0.05
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
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
												"progress": 0.35,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "PatternLights02",
							"enabled": false,
							"x": -0.15241,
							"y": 32.56895,
							"z": 6.90985,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"rotationZ": 9.939233379573491e-17,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": 0.50884,
									"y": -30.56718,
									"z": -3.33922,
									"scaleX": 75.20000000000003,
									"scaleY": 75.20000000000003,
									"scaleZ": 75.20000000000003,
									"rotationZ": -1.691784405033785e-16,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase06.png",
												"uvShift": [
													0,
													0.05
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
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
																"color": -13754522
															},
															{
																"position": 0.30859375,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -4033215
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"x": 0.50884,
									"y": -30.56718,
									"z": -3.33922,
									"scaleX": 75.20000000000003,
									"scaleY": 75.20000000000003,
									"scaleZ": 75.20000000000003,
									"rotationZ": -1.691784405033785e-16,
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
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_CircuitPattern_VerniusBase06.png",
												"uvShift": [
													0,
													0.05
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
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
												"progress": 0.35,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/noise/DissolveCircuit.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													-0.04
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
	]
}