{
	"type": "fx",
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
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
			"children": [
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"alignMode": "Screen",
						"emitSurface": true,
						"lifeTime": 0.4,
						"lifeTimeRand": 0.05,
						"maxCount": 10,
						"frameCount": 4,
						"frameDivisionX": 2,
						"frameDivisionY": 2,
						"instScale": 3.5,
						"instOffset": [
							0,
							0,
							7
						],
						"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_01.png",
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
						"animationBlendBetweenFrames": false
					},
					"z": 2.5,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
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
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"blendBetweenFrames": true,
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
										"speed": 10,
										"frameDivision": [
											2,
											2
										],
										"totalFrames": 4,
										"startTime": 0,
										"loop": false
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
											0.5686274509803921,
											0.47058823529411764,
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
													"value": 1,
													"mode": 0
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
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
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.31375390378303813,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal_Green",
					"z": 4,
					"scaleX": 12,
					"scaleY": 12,
					"scaleZ": 8,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Gradients/circGrad05.jpg",
					"fadePower": 3,
					"emissive": 1,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 2
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.10837271827219012,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1183727182721901,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.18333308967252537,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.2509382163368004,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.35,
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
									0.580392156862745,
									0.4549019607843137,
									0.9921568627450981
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.03485975677854325,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.10527968055035841,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.19917291224611194,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.3480308554906656,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0.13934203771706083,
												"dt": -0.0940868914220308
											},
											"nextHandle": {
												"dv": -0.0005562475711130138,
												"dt": 0.47318471673981344
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