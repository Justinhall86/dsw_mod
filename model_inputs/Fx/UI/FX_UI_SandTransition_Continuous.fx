{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Leto",
					"source": "Character/Atreide/Leader/Leto/Leto.fbx",
					"editorOnly": true,
					"x": -0.08,
					"y": 0.08,
					"rotationZ": 150,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "None",
									"shadows": false,
									"culling": "None",
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": true
								}
							},
							"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Hair_Albedo.png",
							"normalMap": "Character/Atreide/Leader/Leto/Leto_Hair_Normal.png",
							"specularMap": "Character/Atreide/Leader/Leto/Leto_Hair_MetallicGlossAO.png",
							"materialName": "Hair",
							"children": [
								{
									"type": "anisotropy",
									"name": "anisotropy",
									"mode": "Texture",
									"intensity": 0.77,
									"direction": 90,
									"noiseIntensity": 0.19,
									"intensityFactor": 0.74,
									"noiseIntensityPath": "Character/Atreide/Leader/Leto/Leto_Hair_AnisoIntensity.png",
									"noiseDirectionPath": "Character/Atreide/Leader/Leto/Leto_Hair_AnisoAngle.png",
									"rotationOffset": 136.36
								},
								{
									"type": "specularColor",
									"name": "specularColor",
									"specular": 0.39,
									"specularTint": 0.47,
									"specularColorCustomValue": 16746544,
									"mode": "Flat"
								}
							]
						},
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "None",
									"shadows": true,
									"culling": "Back",
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false
								}
							},
							"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Body_Albedo.png",
							"normalMap": "Character/Atreide/Leader/Leto/Leto_Body_Normal.png",
							"specularMap": "Character/Atreide/Leader/Leto/Leto_Body_MetallicGlossAO.png",
							"materialName": "Leto",
							"children": [
								{
									"type": "specularColor",
									"name": "specularColor",
									"specular": 0.34,
									"specularTint": 1,
									"specularColorPath": "Character/Atreide/Leader/Leto/Leto_Body_SpecColor.png",
									"mode": "Texture"
								},
								{
									"type": "anisotropy",
									"name": "anisotropy",
									"mode": "Texture",
									"intensity": 0.78,
									"direction": 147.27,
									"intensityFactor": 0.35,
									"noiseIntensityPath": "Character/Atreide/Leader/Leto/Leto_Body_AnisoIntensity.png",
									"noiseDirectionPath": "Character/Atreide/Leader/Leto/Leto_Body_AnisoAngle.png",
									"rotationOffset": 68.18
								},
								{
									"type": "sss",
									"name": "sss",
									"props": {},
									"mainColor": 13503488,
									"nearColor": 16724261,
									"intensity": 0.1,
									"nearRatio": 1,
									"maxAmountPerLight": 0.1,
									"translucencyTexture": "Character/Atreide/Leader/Leto/Leto_Body_SSSThickness.png"
								}
							]
						},
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "Add",
									"shadows": false,
									"culling": "Back",
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false
								}
							},
							"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Cornea_Albedo.png",
							"specularMap": "Character/Atreide/Leader/Leto/Leto_Cornea_MetallicGlossAO.png",
							"materialName": "Mat_Cornea"
						}
					]
				},
				{
					"type": "light",
					"name": "Main_Light_0",
					"editorOnly": true,
					"x": 0.17659,
					"y": 3.74001,
					"z": 1.70564,
					"rotationX": 3,
					"rotationY": 12.8,
					"rotationZ": -93.1,
					"kind": "Spot",
					"color": 16772306,
					"power": 1.74,
					"range": 3.16,
					"zNear": 0.02,
					"angle": 39.43,
					"fallOff": 15.68,
					"shadows": {
						"mode": "Dynamic",
						"size": 2048,
						"radius": 0,
						"quality": 1,
						"bias": 0.001,
						"samplingMode": {
							"kind": "None"
						}
					}
				},
				{
					"type": "object",
					"name": "group",
					"x": -1.01367,
					"y": 0.49715,
					"z": 1.06105,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "object",
							"name": "SandMEsh",
							"x": 1.2433899999999998,
							"y": 0.0025900000000000367,
							"z": 0.13949499999999992,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationY": -17.840045638310716,
									"rotationZ": 36.46387872750811,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true,
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
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
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"progress": 0.36,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 2.5,
														"uvScaleY": 5,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
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
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
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
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"progress": 0.45,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 10,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.1666666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
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
														"progress": 0.5,
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
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
																	"time": 0.20022583007812503,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"alphaKill": false,
															"textureWrap": true
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
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44706363959092527,
																		"dt": -0.43935220941158515
																	},
																	"nextHandle": {
																		"dv": -1.035,
																		"dt": 1.015201416015625
																	}
																},
																{
																	"time": 1.515,
																	"value": 0.1,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_01_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.8809936523437502,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.8092248535156257,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0011111111111110628,
																		"dt": -0.845
																	},
																	"nextHandle": {
																		"dv": -4.850962043289239e-16,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.012389767304249124,
																		"dt": -0.4999870612133972
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.695
																	}
																},
																{
																	"time": 1.275,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.425
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3,
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
														"progress": 0.5,
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
													},
													"isInstance": true,
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
																	"value": 1.9843398999600195,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.07018770099514808,
																		"dt": -0.5753869969311751
																	},
																	"nextHandle": {
																		"dv": 0.07018770099514808,
																		"dt": 0.5753869969311751
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 0
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
																	"time": 0.20022583007812503,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftSpeedY",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.0666666666666667,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03525641025640969,
																		"dt": -0.5849999999999999
																	},
																	"nextHandle": {
																		"dv": -0.028604487838585567,
																		"dt": 0.4350742600248863
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7019607843137254,
															0.6509803921568628,
															0.5490196078431373
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.4392156862745098,
															0.21568627450980393,
															0.09803921568627451
														],
														"pointA": 0,
														"colorB": [
															0.44313725490196076,
															0.34509803921568627,
															0.24705882352941178
														],
														"pointB": 0.43
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
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "polygon",
			"name": "polygon",
			"editorOnly": true,
			"x": -1.44389,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
			"rotationX": 90,
			"rotationZ": 90,
			"color": -16777216,
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
					"color": [
						0,
						0,
						0,
						1
					]
				}
			]
		}
	]
}