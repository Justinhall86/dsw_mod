{
	"type": "fx",
	"cullingRadius": 1500,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.7,
			"scaleY": 0.7,
			"scaleZ": 0.7,
			"children": [
				{
					"type": "object",
					"name": "Test02",
					"children": [
						{
							"type": "object",
							"name": "group",
							"children": [
								{
									"type": "object",
									"name": "Missile",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv_LessVrtx.fbx",
											"x": -0.73829,
											"y": 0.00156,
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 2.14,
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
											"source": "Fx/Meshes_Common/Missile_LessVrtx.fbx",
											"scaleX": 3.3,
											"scaleY": 3.3,
											"scaleZ": 3.3,
											"rotationZ": 90.00000000000004,
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
															"depthTest": "LessEqual",
															"emissive": 0.1
														}
													},
													"diffuseMap": "Structure/Buildings/MissileBattery/MissileBattery_Albedo.png"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "MissileGLOW",
											"source": "Fx/Meshes_Common/Missile_LessVrtx.fbx",
											"x": 0.0183,
											"scaleX": 3.4,
											"scaleY": 3.4,
											"scaleZ": 3.4,
											"rotationZ": 90.00000000000004,
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
															"depthTest": "LessEqual",
															"emissive": 10
														}
													},
													"diffuseMap": "Structure/Buildings/MissileBattery/MissileBattery_Albedo.png"
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
														"scale": 0.95,
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.30196078431372547,
															0.17254901960784313,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0,
														"maxAlpha": 1,
														"frequency": 4
													}
												}
											]
										},
										{
											"type": "model",
											"name": "AirResistanceMesh",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
											"enabled": false,
											"x": 1.24766,
											"scaleX": 0.2,
											"scaleY": 0.2,
											"scaleZ": 0.6,
											"rotationX": 180,
											"rotationY": 90,
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
															"drawOrder": "110",
															"emissive": 2,
															"alphaKill": true
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
														"progress": 0.28,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.8,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															2
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
														"progress": 0.36,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.8,
														"texture": "Fx/Gradients/vGrad_uneaven_burn_inv01.png",
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
													"name": "DissolveMap_gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.21,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.8,
														"texture": "Fx/Gradients/Cyl05u_A.jpg",
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7411764705882353,
															0.5843137254901961,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"enabled": false,
															"keys": [
																{
																	"time": 4.268252269562775,
																	"value": 0.23721049502243374,
																	"mode": 2
																},
																{
																	"time": 5.268252269562775,
																	"value": 0.7853981633974483,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"enabled": false,
															"keys": [
																{
																	"time": 4.268252269562775,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 5.268252269562775,
																	"value": 0.8947368421052632,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"enabled": false,
															"keys": [
																{
																	"time": 4.268252269562775,
																	"value": 0.6450980392156862,
																	"mode": 2
																},
																{
																	"time": 5.268252269562775,
																	"value": 0.8509803921568627,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.x",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.05,
															"value": 1.25,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 0.75,
															"mode": 2
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
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.2720888898683747,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.8537390160511498
																	}
																},
																{
																	"time": 7.991447865640069,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"enabled": false,
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": true,
														"bias": 0,
														"scale": 0.92,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
												},
												{
													"type": "curve",
													"name": "visibility",
													"enabled": false,
													"keys": [
														{
															"time": 1.1070762509715804,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1170762509715804,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.01,
															"value": 0,
															"mode": 2
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
															0.5843137254901961,
															0.6431372549019607,
															1
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "trails",
									"name": "trails",
									"enabled": false,
									"endWidth": 2,
									"lifetime": 1.15,
									"minSpeed": 0.01,
									"uvMode": "ELifetime",
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
													"depthTest": "LessEqual"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
												"alpha": 0.8,
												"uScale": 6,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SmokeTrail_Missile03.png"
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
												"progress": 0.8,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -1
															},
															{
																"position": 0.10546875,
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
													0.9803921568627451,
													0.9686274509803922,
													0.9686274509803922
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
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
												"shiftSpeedX": -0.75,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.23137254901960785,
													0.1843137254901961,
													0.30980392156862746
												]
											}
										}
									]
								},
								{
									"type": "trails",
									"name": "trails-Base",
									"enabled": false,
									"endWidth": 0.1,
									"lifetime": 0.45,
									"minSpeed": 0.01,
									"uvMode": "ELifetime",
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
													"emissive": 3
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
												"uScale": 3,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SmokeTrail_Missile.png"
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
												"progress": 0.8,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -1
															},
															{
																"position": 0.1953125,
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
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": -0.1,
												"shiftSpeedY": 0
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
																"position": 0.16796875,
																"color": -94628609
															},
															{
																"position": 1,
																"color": -12075811
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
									"type": "trails",
									"name": "Trails_tiling",
									"enabled": false,
									"startWidth": 0.5,
									"endWidth": 1.25,
									"lifetime": 0.2,
									"minSpeed": 0.0001,
									"uvMode": "ETileFixed",
									"uvStretch": 0.075,
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
													"culling": "Back",
													"colorMask": 255,
													"drawOrder": "100",
													"emissive": 3
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": false,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_14.png",
												"speed": 5,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4784313725490196,
													0.5411764705882353,
													1
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