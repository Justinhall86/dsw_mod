{
	"type": "fx",
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.3,
			"scaleY": 1.3,
			"scaleZ": 1.3,
			"children": [
				{
					"type": "object",
					"name": "group",
					"x": -0.5,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "model",
							"name": "Reactor_Little",
							"source": "Fx/Meshes_Common/CylinderCone_BottomPiv_LessVrtx.fbx",
							"x": -0.73829,
							"y": 0.00156,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 2.41,
							"rotationY": -90,
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
											"emissive": 8
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
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
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
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.87,
										"color": [
											0.16470588235294117,
											0.2784313725490196,
											1
										]
									},
									"isInstance": true
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
						},
						{
							"type": "model",
							"name": "Missile",
							"source": "Structure/Buildings/NukeSilo/Missile.fbx",
							"x": -0.72721,
							"scaleX": 3.3,
							"scaleY": 3.3,
							"scaleZ": 3.3,
							"rotationY": 90,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Structure/Buildings/NukeSilo/Missile_Albedo.png"
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": true,
										"ALPHA": false,
										"REVERSE": false,
										"bias": 0.1,
										"scale": 1,
										"power": 1,
										"color": [
											1,
											0.21176470588235294,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 5.477072539503104,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6013545616817201
													}
												},
												{
													"time": 7.2811362245482645,
													"value": 1.1333333333333333,
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
							"name": "FlareRound",
							"enabled": false,
							"x": -0.65349,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 4.25,
											"scaleY": 4.25,
											"scaleZ": 4.25,
											"rotationX": 90,
											"rotationZ": 90,
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
															"emissive": 8
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
														"alpha": 0.2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.1,
																	"mode": 2
																},
																{
																	"time": 0.042091836734693876,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.1568877551020408,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.28188775510204084,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.32142857142857145,
																	"value": 0.1,
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
															0.5098039215686274,
															0.29411764705882354
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.04193765992712713,
													"value": 1.0666666666666667,
													"mode": 2
												},
												{
													"time": 0.15726622472672672,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 0.2830792045081081,
													"value": 1.1,
													"mode": 2
												},
												{
													"time": 0.3197746569443443,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"lifeTime": 0.2,
										"lifeTimeRand": 0.01,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstCount": 5,
										"burstDelay": 0.05,
										"instScale": 2.5,
										"instStretch": [
											12,
											1,
											1
										],
										"instRotation_rand": [
											0,
											0,
											3
										],
										"instStretch_rand": [
											7,
											0,
											0
										],
										"instScale_rand": 2,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"maxCount": 25
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
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 4,
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
														"alpha": 0.4,
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
															1,
															0.4588235294117647,
															0.12156862745098039
														]
													},
													"isInstance": true
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keys": [
												{
													"time": 3.9788630050417364,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.988863005041736,
													"value": 1.5,
													"mode": 2
												},
												{
													"time": 6.99,
													"value": 1.5,
													"mode": 2
												},
												{
													"time": 7,
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
										"range": 2.5,
										"power": 0.8
									}
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
			]
		}
	]
}