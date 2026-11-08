{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"locked": true,
			"z": 0.1,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
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
					"color": [
						0.00784313725490196,
						0.00784313725490196,
						0.00784313725490196,
						1
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": -1,
			"rotationZ": 90,
			"children": [
				{
					"type": "reference",
					"name": "Prefab_Ecaz",
					"source": "Structure/Base/Ecaz/Prefab_BaseEcaz.prefab",
					"editorOnly": true,
					"locked": true
				},
				{
					"type": "model",
					"name": "Ecaz_MainBase",
					"source": "Structure/Base/Ecaz/Ecaz_MainBase.fbx",
					"editorOnly": true,
					"rotationZ": -20
				},
				{
					"type": "model",
					"name": "Ecaz_MainBase",
					"source": "Structure/Base/Carthag/BaseCarthag.fbx",
					"enabled": false,
					"z": -1,
					"scaleX": 7.5,
					"scaleY": 7.5,
					"scaleZ": 7.5,
					"rotationZ": 70
				},
				{
					"type": "object",
					"name": "AdminBurden",
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Dots",
							"scaleX": 150.00000000000009,
							"scaleY": 150.00000000000009,
							"scaleZ": 62.5,
							"rotationZ": 159.99999999999997,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"normalFade": true,
							"normalFadeStart": 0.65,
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.82,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/bluenoise_raw.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.2
									}
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
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "FloorClogs",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Clog",
									"scaleX": 35,
									"scaleY": 35,
									"scaleZ": 43.75,
									"rotationZ": -25.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 0.9,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Logo_Clog_Thin.png"
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 2,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 3,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 4,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 5,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 6,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 7,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 8,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 9,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 10,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 11,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 12,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 13,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499584372402325
													}
												},
												{
													"time": 14.00498753117207,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499584372402325
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33167082294264344
													}
												},
												{
													"time": 15,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33167082294264344
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 16,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 17,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 18,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 19,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 20,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ClogLight",
									"scaleX": 35,
									"scaleY": 35,
									"scaleZ": 43.75,
									"rotationZ": -25.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Logo_Clog_Thin.png"
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 2,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 3,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 4,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 5,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 6,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 7,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 8,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 9,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 10,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 11,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 12,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 13,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499584372402325
													}
												},
												{
													"time": 14.00498753117207,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499584372402325
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33167082294264344
													}
												},
												{
													"time": 15,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33167082294264344
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 16,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 17,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 18,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 19,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 20,
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.8,
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
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Fade",
									"scaleX": 27,
									"scaleY": 27,
									"scaleZ": 33.75,
									"rotationZ": -25.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_LensFlare_07.png"
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 2,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 3,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 4,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 5,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 6,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 7,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 8,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 9,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 10,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 11,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 12,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 13,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499584372402325
													}
												},
												{
													"time": 14.00498753117207,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499584372402325
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33167082294264344
													}
												},
												{
													"time": 15,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33167082294264344
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 16,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 17,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 18,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 19,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 20,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Circle",
									"scaleX": 32,
									"scaleY": 32,
									"scaleZ": 40,
									"rotationZ": -25.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Circle_6.png"
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 2,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 3,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 4,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 5,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 6,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 7,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 8,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 9,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 10,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 11,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 12,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 13,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499584372402325
													}
												},
												{
													"time": 14.00498753117207,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499584372402325
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33167082294264344
													}
												},
												{
													"time": 15,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33167082294264344
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 16,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 17,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 18,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 19,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												},
												{
													"time": 20,
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
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
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
													"time": 0.25,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.08555766529303215,
														"dt": -0.4998269596764236
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.19473297452446559
													}
												},
												{
													"time": 0.6811657253963566,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 37,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationZ": 75.97390334733981,
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
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": 90,
									"rotationY": 180,
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
													"mode": "AfterTonemapping",
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
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": false,
												"blendBetweenFrames": false,
												"startFrame": 1,
												"texture": "Fx/Alphas/T_LogoHourglass_4x2.png",
												"speed": 0,
												"frameDivision": [
													4,
													2
												],
												"totalFrames": 8,
												"startTime": 0,
												"loop": false
											},
											"children": [
												{
													"type": "curve",
													"name": "startFrame",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "startFrame",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.25,
															"value": 8,
															"mode": 2
														},
														{
															"time": 2,
															"value": 8,
															"mode": 2
														}
													]
												}
											]
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
											"type": "curve",
											"name": "rotation.x",
											"keyMode": 1,
											"loop": true,
											"keys": [
												{
													"time": 1.25,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": 0.08819444444444446,
														"dt": -0.615
													},
													"nextHandle": {
														"dv": -0.7138888888888889,
														"dt": 0.0050000000000003375
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
													0.9058823529411765,
													0.803921568627451
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.242592718555283,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.08555766529303215,
												"dt": -0.4998269596764236
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.19473297452446559
											}
										},
										{
											"time": 1.492592718555283,
											"value": 1,
											"mode": 2
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.992592718555283,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.08555766529303215,
														"dt": -0.4998269596764236
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.19473297452446559
													}
												},
												{
													"time": 1.492592718555283,
													"value": 1,
													"mode": 2
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