{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
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
			"rotationZ": 180,
			"children": [
				{
					"type": "object",
					"name": "ExplosionSlow",
					"z": 2,
					"children": [
						{
							"type": "object",
							"name": "Flames",
							"x": -2.92877,
							"y": 5.864975,
							"z": -1.3978400000000002,
							"children": [
								{
									"type": "emitter",
									"name": "Fireopenings_BigDoor",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"instStretch": [
											1,
											2.5,
											9
										],
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0.2,
											0.75
										],
										"instScale": 353,
										"instScale_rand": 1,
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
											0
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
										"lifeTime": 3.2
									},
									"x": 0.22993,
									"y": 2.47738,
									"z": 6.71937,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -69.9,
									"rotationY": -0.9,
									"rotationZ": 16.3,
									"children": [
										{
											"type": "model",
											"name": "TriangularCylinder",
											"source": "Fx/Meshes_Common/TriangularCylinder.fbx",
											"scaleX": 0.5,
											"scaleY": 0.15,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationZ": -90,
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
															"emissive": 40,
															"drawOrder": "-80",
															"depthWrite": "Off"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.5449999999999999
																	},
																	"nextHandle": {
																		"dv": 0.010192021509306938,
																		"dt": 0.33327910335433686
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
														"range": 15,
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
															0.6941176470588235,
															0.3607843137254902,
															0.2588235294117647
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
														"progress": 0.45,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2.5,
														"uvScaleY": 2.5,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.2
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
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.044066720545493605,
																		"dt": -1.1385534908346637
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.4306172839506173
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.26,
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
														"bias": 0.21,
														"scale": 1,
														"power": 1,
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
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.7525956070201336,
														"dt": -0.10924774940614855
													},
													"nextHandle": {
														"dv": 0.5166666666666666,
														"dt": 0.075
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.74
													},
													"nextHandle": {
														"dv": -2.7214373314385623e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Fireopenings",
									"enabled": false,
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"instStretch": [
											1,
											1,
											7
										],
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0.2,
											0.75
										],
										"instScale": 200,
										"instScale_rand": 1,
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
											0
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
										"lifeTime": 3.2
									},
									"x": 7.22991,
									"y": 3.81548,
									"z": 9.11373,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -23.8,
									"rotationY": 53.4,
									"rotationZ": 78.7,
									"children": [
										{
											"type": "model",
											"name": "TriangularCylinder",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv01.fbx",
											"scaleX": 0.5,
											"scaleY": 0.2,
											"scaleZ": 0.5,
											"rotationX": 90,
											"rotationZ": -90,
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
															"emissive": 10,
															"drawOrder": "-80",
															"depthWrite": "Off"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.5449999999999999
																	},
																	"nextHandle": {
																		"dv": 0.010192021509306938,
																		"dt": 0.33327910335433686
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
														"range": 15,
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
															0.6941176470588235,
															0.3607843137254902,
															0.2588235294117647
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
														"progress": 0.45,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2.25,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-0.2
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
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.044066720545493605,
																		"dt": -1.1385534908346637
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.4306172839506173
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.26,
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
														"bias": 0.21,
														"scale": 1,
														"power": 1,
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
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.7525956070201336,
														"dt": -0.10924774940614855
													},
													"nextHandle": {
														"dv": 0.5166666666666666,
														"dt": 0.075
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.74
													},
													"nextHandle": {
														"dv": -2.7214373314385623e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "WindowsL",
									"x": -7.08998,
									"y": 1.33685,
									"z": 5.0108,
									"scaleX": 4,
									"scaleY": 8,
									"scaleZ": 6,
									"rotationX": -62.7,
									"rotationY": 35.4,
									"rotationZ": -2.6,
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
													"emissive": 40,
													"drawOrder": "-80",
													"depthWrite": "Off"
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
												"texture": "Fx/Alphas/T_UI_Round_256.png"
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
															"time": 0.030303030303030304,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4526567421989025,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8074512372986241
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8074512372986241
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 0.6,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "WindowsR",
									"x": 8.31061,
									"y": 4.85053,
									"z": 6.73341,
									"scaleX": 5,
									"scaleY": 10,
									"scaleZ": 6,
									"rotationX": -39.7,
									"rotationY": -36.3,
									"rotationZ": 12.5,
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
													"emissive": 40,
													"drawOrder": "-80",
													"depthWrite": "Off"
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
												"texture": "Fx/Alphas/T_UI_Round_256.png"
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
															"time": 0.030303030303030304,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4526567421989025,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8074512372986241
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8074512372986241
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Door",
									"x": 0.87572,
									"y": -1.04897,
									"z": 4.52468,
									"scaleX": 10,
									"scaleY": 20,
									"scaleZ": 9,
									"rotationX": -76.1,
									"rotationZ": 12.5,
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
													"emissive": 40,
													"drawOrder": "-80",
													"depthWrite": "Off"
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
												"texture": "Fx/Alphas/T_UI_Round_256.png"
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
															"time": 0.030303030303030304,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4526567421989025,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8074512372986241
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8074512372986241
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 3,
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
					"type": "light",
					"name": "light_0",
					"x": -2.22148,
					"y": 7.01357,
					"z": 4.50071,
					"color": 11623490,
					"range": 110,
					"zNear": 0.02,
					"children": [
						{
							"type": "curve",
							"name": "power",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.01458311080932595,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.02458311080932596,
									"value": 2.5,
									"mode": 2
								},
								{
									"time": 3.8502740287780775,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1.2752303059895838
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1.2752303059895838
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LensFlare",
					"z": 0.62832,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "emitter",
							"name": "LensFlare_circle",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 1.5,
								"maxCount": 5,
								"simulationSpace": "World",
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
									150
								],
								"instScale": 10,
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
								],
								"instOffset": [
									1,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									25
								],
								"instOffset_rand": [
									0.2,
									0,
									0
								],
								"lifeTime": 1.8,
								"warmUpTime": -0.05
							},
							"x": 0.40694,
							"y": -0.2175,
							"z": 2.57515,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
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
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_01.png",
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
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
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
												"range": 5,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LensFlare_color_big2",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
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
									0
								],
								"instScale": 18,
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
								],
								"warmUpTime": -0.05,
								"instRotation": [
									20,
									0,
									0
								],
								"lifeTime": 3
							},
							"z": 1.25,
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
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 15
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/T_circleGradient_color_double.png",
											"color": [
												0.9411764705882353,
												0.807843137254902,
												0.7058823529411764,
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_Double.png",
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
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
												"range": 24.24,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
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
								"alpha": 0.6
							}
						}
					]
				},
				{
					"type": "model",
					"name": "SietchTabr_mesh",
					"source": "Structure/Sietch/MajorSietch/MajorSietch_01/MajorSietch_01.fbx",
					"editorOnly": true,
					"x": -1.91752,
					"y": 5.89262,
					"scaleX": 4.96,
					"scaleY": 4.96,
					"scaleZ": 4.96,
					"rotationZ": -162
				}
			]
		}
	]
}