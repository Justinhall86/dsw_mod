{
	"type": "fx",
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.2,
			"scaleY": 1.2,
			"scaleZ": 1.2,
			"children": [
				{
					"type": "object",
					"name": "MissileHead",
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"rotationZ": -90,
					"children": [
						{
							"type": "model",
							"name": "halphSphere",
							"source": "Fx/Meshes_Common/Missile.fbx",
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"rotationZ": 180,
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
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": -0.0050000000000000044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.039999999999999994,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03847676217770362,
														"dt": -0.03334652722067646
													},
													"nextHandle": {
														"dv": -0.5333333333333333,
														"dt": 0.4617283950617284
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.41135802469135807
													},
													"nextHandle": {
														"dv": 0.012980169199833783,
														"dt": 0.3199852081262777
													}
												}
											]
										}
									]
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
											0.7647058823529411,
											1,
											0.2549019607843137
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Reactor_2",
							"props": {
								"emitType": "Burst",
								"instScale": 0.2,
								"speedFactor": 0.1,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch": [
									0.7,
									0.7,
									0.7
								],
								"instScale_rand": 0
							},
							"x": -0.01909,
							"y": -1.21491,
							"scaleX": 0.08333333333333334,
							"scaleY": 0.08333333333333334,
							"scaleZ": 0.08333333333333333,
							"rotationZ": 90,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.4,
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
													"emissive": 20
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
												"progress": 0.12,
												"saturation": 1,
												"width": 0.59,
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
												"progress": 0.24,
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
												"amount": 1,
												"color": [
													0.9372549019607843,
													1,
													0.2549019607843137
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Reactor_1",
							"props": {
								"emitType": "Burst",
								"instScale": 0.16,
								"speedFactor": 0.1,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									0.15,
									0,
									0
								],
								"instStretch": [
									0.6,
									0.8,
									0.8
								]
							},
							"x": 0.01364,
							"y": -0.80181,
							"scaleX": 0.08333333333333334,
							"scaleY": 0.08333333333333334,
							"scaleZ": 0.08333333333333333,
							"rotationZ": 90,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.5,
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
												"progress": 0.2,
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
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderCone_BottomPiv",
							"source": "Fx/Meshes_Common/HemiIcosphere.fbx",
							"enabled": false,
							"y": 1.22133,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 4,
							"rotationX": -90,
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
										"texture": "Fx/Alphas/T_HitBloodShape02_Alpha02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 4.440892098500626e-16,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.2635136506008986,
														"dt": -0.33307908776325124
													},
													"nextHandle": {
														"dv": 0.6259166666666666,
														"dt": 0.16499999999999954
													}
												},
												{
													"time": 0.085,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.6278333333333334,
														"dt": -0.13500000000000023
													},
													"nextHandle": {
														"dv": 0.4380052097932492,
														"dt": 0.09447056848156885
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": -0.0050000000000000044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.185,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 0,
										"width": 0.59,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-1,
											-1.75
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
										"useScale": false,
										"wrap": true,
										"progress": 0.38,
										"saturation": 1,
										"width": 0.81,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/T_circle3.png",
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
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7647058823529411,
											1,
											0.2549019607843137
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
						}
					]
				}
			]
		}
	]
}