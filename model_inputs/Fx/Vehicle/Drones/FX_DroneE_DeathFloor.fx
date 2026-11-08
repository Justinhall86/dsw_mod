{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 1,
			"children": [
				{
					"type": "model",
					"name": "DroneE",
					"source": "Vehicle/Ecaz/DroneE/DroneE.fbx",
					"enabled": false,
					"scaleX": 4.8,
					"scaleY": 4.8,
					"scaleZ": 4.8,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneE/Anim_DroneE_Death.fbx"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
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
					"type": "object",
					"name": "Death_NoConstraint",
					"enabled": false,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": -0.31031,
							"y": 0.13013,
							"z": 2.22919,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"rotationX": 6.8,
							"rotationY": 8.8,
							"rotationZ": -13.3,
							"time": -0.4,
							"children": [
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"props": {
										"levelMin": 0.15,
										"levelMax": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "levelMin",
											"keys": [
												{
													"time": 0.15007173601147775,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.27012912482066,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9979770444763271,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"enabled": false,
					"children": [
						{
							"type": "object",
							"name": "Flag",
							"y": -0.6686799999999999,
							"z": -1.3877787807814457e-17,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 3.9756933518293955e-16,
							"rotationY": 1.7393658414253607e-16,
							"children": [
								{
									"type": "polygon",
									"name": "Braise",
									"z": -1.0408340855860843e-17,
									"scaleX": 0.6500000000000001,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.6500000000000001,
									"rotationX": -3.0582256552533806e-16,
									"rotationY": 3.1537952069800493e-16,
									"rotationZ": 180,
									"kind": 0,
									"args": [
										8
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
													"emissive": 5
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/noise/T_Embers04.png",
											"normalMap": "Fx/DistortionMaps/psfixnormal.jpg",
											"specularMap": "Fx/Gradients/z_FillGrey50.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_EccazFlag_DroneE.png",
												"onDecal": false
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
												"bias": 0.15,
												"scale": 0.76,
												"power": 1,
												"color": [
													1,
													0.5176470588235293,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"props": {
												"levelMin": 0.15,
												"levelMax": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "levelMin",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": -0.010000000000000002,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.11000000000000004,
															"value": 0.9885366870684298,
															"mode": 2
														},
														{
															"time": 0.21500000000000005,
															"value": 0.3746893466403401,
															"mode": 2
														},
														{
															"time": 0.3600000000000001,
															"value": 0.8423825583950751,
															"mode": 2
														},
														{
															"time": 0.4900000000000001,
															"value": 0.6962284297217205,
															"mode": 2
														},
														{
															"time": 0.5900000000000002,
															"value": 0.9885366870684298,
															"mode": 2
														},
														{
															"time": 0.7300000000000002,
															"value": 0.21391980509964992,
															"mode": 2
														},
														{
															"time": 0.8800000000000002,
															"value": 0.9008442098644169,
															"mode": 2
														},
														{
															"time": 0.9950000000000003,
															"value": 0.5354588881810303,
															"mode": 2
														},
														{
															"time": 1.0900000000000003,
															"value": 0.9885366870684298,
															"mode": 2
														},
														{
															"time": 1.1800000000000004,
															"value": -0.034542213645053055,
															"mode": 2
														},
														{
															"time": 1.2800000000000002,
															"value": 0.5500743010483657,
															"mode": 2
														},
														{
															"time": 1.4100000000000004,
															"value": 0.12622732789563712,
															"mode": 2
														},
														{
															"time": 1.5350000000000004,
															"value": 0.710843842589056,
															"mode": 2
														},
														{
															"time": 1.6050000000000004,
															"value": 0.25776604370165634,
															"mode": 2
														},
														{
															"time": 1.7950000000000004,
															"value": 0.9885366870684298,
															"mode": 2
														},
														{
															"time": 1.8800000000000006,
															"value": -0.04915762651238853,
															"mode": 2
														},
														{
															"time": 2.085000000000001,
															"value": 0.5939205396503722,
															"mode": 2
														},
														{
															"time": 2.290000000000001,
															"value": 0.12622732789563712,
															"mode": 2
														},
														{
															"time": 2.540000000000001,
															"value": 0.9885366870684298,
															"mode": 2
														},
														{
															"time": 2.615000000000001,
															"value": 0.2285352179669854,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "levelMax",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.44000000000000017,
															"value": 0.87,
															"mode": 2
														},
														{
															"time": 0.7850000000000001,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1650000000000007,
															"value": 0.95,
															"mode": 2
														},
														{
															"time": 2.190000000000001,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3450000000000006,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 2.615,
															"value": 1,
															"mode": 2
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
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12710654
															},
															{
																"position": 0.265625,
																"color": -7198190
															},
															{
																"position": 0.5859375,
																"color": -45568
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
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.88,
												"useRGB": false
											},
											"children": [
												{
													"type": "curve",
													"name": "threshold",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8333333333333334
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8333333333333334
															}
														},
														{
															"time": 5,
															"value": 0.95,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.12156862745098039,
													0.12156862745098039,
													0.12156862745098039
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.007369325692528239,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.15373351017775044,
																"dt": -0.4998685393649289
															},
															"nextHandle": {
																"dv": 0.08333333333333331,
																"dt": 0.27104882165779787
															}
														},
														{
															"time": 0.7926923112566069,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26177432852135957
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.26177432852135957
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.007369325692528239,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.15373351017775044,
																"dt": -0.4998685393649289
															},
															"nextHandle": {
																"dv": 0.08333333333333331,
																"dt": 0.27104882165779787
															}
														},
														{
															"time": 0.9572100545709921,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.26177432852135957
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.26177432852135957
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 0.8,
												"texture": "Fx/Gradients/vGrad_uneaven_burn_inv.png",
												"uvShift": [
													0,
													0.2
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
															"time": 0.026489088847542523,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5331162393720427,
															"value": 1.66,
															"mode": 1,
															"prevHandle": {
																"dv": -0.4706938952500297,
																"dt": -0.2052420918564723
															},
															"nextHandle": {
																"dv": -0.002363647283144532,
																"dt": 0.09770724507109929
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds_Dissolve.png",
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
															"time": 0.08734670663240203,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5331162393720427,
															"value": 1.4,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": 0.06003813632869936,
																"dt": 0.3332116566242845
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": false,
												"texScaleX": 1,
												"texScaleY": 0.5,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 0.8,
												"scrollSpeed": [
													0,
													-0.8
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09521538070697104,
																"dt": -0.4999832042862614
															},
															"nextHandle": {
																"dv": 0.03333333333333333,
																"dt": 0.1750358680057389
															}
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09521538070697104,
																"dt": -0.4999832042862614
															},
															"nextHandle": {
																"dv": 0.03333333333333333,
																"dt": 0.1750358680057389
															}
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.973532046827975,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "Flag",
									"z": -1.0408340855860843e-17,
									"scaleX": 0.6500000000000001,
									"scaleY": 0.6500000000000001,
									"scaleZ": 0.6500000000000001,
									"rotationX": -3.0582256552533806e-16,
									"rotationY": 3.1537952069800493e-16,
									"rotationZ": 180,
									"kind": 0,
									"args": [
										8
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "PBR",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"textureWrap": true,
													"drawOrder": "120"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Alphas/T_EccazFlag_DroneE01.png"
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/T_Flag_normal03.png",
											"envBlend": 0.2,
											"children": [
												{
													"type": "curve",
													"name": "normalUVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1.8524432800032884,
															"mode": 2
														},
														{
															"time": 1.6,
															"value": -0.148,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_EccazFlag_DroneE.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": false,
												"texScaleX": 1,
												"texScaleY": 0.5,
												"tex": "Fx/Alphas/T_Flag_red.png",
												"intensity": 0.8,
												"scrollSpeed": [
													0,
													-0.8
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09521538070697104,
																"dt": -0.4999832042862614
															},
															"nextHandle": {
																"dv": 0.03333333333333333,
																"dt": 0.1750358680057389
															}
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09521538070697104,
																"dt": -0.4999832042862614
															},
															"nextHandle": {
																"dv": 0.03333333333333333,
																"dt": 0.1750358680057389
															}
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.973532046827975,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 0.8,
												"texture": "Fx/Gradients/vGrad_uneaven_burn_inv.png",
												"uvShift": [
													0,
													0.2
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
															"time": 0.026489088847542523,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5331162393720427,
															"value": 1.6,
															"mode": 1,
															"prevHandle": {
																"dv": -0.4706938952500297,
																"dt": -0.2052420918564723
															},
															"nextHandle": {
																"dv": -0.002363647283144532,
																"dt": 0.09770724507109929
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
															"time": 0.026489088847542523,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5331162393720427,
															"value": 1.67,
															"mode": 1,
															"prevHandle": {
																"dv": -0.4706938952500297,
																"dt": -0.2052420918564723
															},
															"nextHandle": {
																"dv": -0.002363647283144532,
																"dt": 0.09770724507109929
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds_Dissolve.png",
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
													"keys": [
														{
															"time": 0.08734670663240203,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5331162393720427,
															"value": 1.4,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": 0.06003813632869936,
																"dt": 0.3332116566242845
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.08734670663240203,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5331162393720427,
															"value": 1.55,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": 0.06003813632869936,
																"dt": 0.3332116566242845
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 1,
												"useRGB": false
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"x": 1.232595164407831e-32,
							"y": -0.59091,
							"z": -0.08196500000000007,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Top",
									"x": -6.938893903907228e-18,
									"y": 0.33667,
									"z": 0.08196500000000005,
									"scaleX": 1.5,
									"scaleY": 0.7500000000000004,
									"scaleZ": 0.7500000000000001,
									"rotationX": 89.99999999999999,
									"rotationY": -2.0292601483295876e-16,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.17082124563358678,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.48399352929516254,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 1.3131883258081982,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -0.476875977393763
															},
															"nextHandle": {
																"dv": 0.011917906903192764,
																"dt": 0.33541161656743307
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Bottom",
									"y": -0.3366699999999998,
									"z": -0.08196499999999995,
									"scaleX": 2,
									"rotationX": -169.7,
									"rotationY": -7.143823991568446e-17,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.05694041521119559,
															"value": 0.5086111111111111,
															"mode": 2
														},
														{
															"time": 0.3069254570359401,
															"value": 1.15,
															"mode": 2
														},
														{
															"time": 1.188631167533708,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.7188727420413442
															},
															"nextHandle": {
																"dv": 0.007906061509264204,
																"dt": 0.33541684618498574
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.013119495096574122,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.03935848528972236,
															"value": 0.5086111111111111,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.018980138403731864
															},
															"nextHandle": {
																"dv": -0.019722222222222252,
																"dt": 0.04810481535410511
															}
														},
														{
															"time": 0.1005827957404016,
															"value": 1.15,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.020408103483559748
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.06878088709851284
															}
														},
														{
															"time": 0.3069254570359401,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 1.188631167533708,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.7188727420413442
															},
															"nextHandle": {
																"dv": 0.007906061509264204,
																"dt": 0.33541684618498574
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
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
							"name": "Explosion",
							"x": -0.045549999999999966,
							"y": -0.5553549999999999,
							"z": 0.0014650000000000496,
							"children": [
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris.fx",
									"x": -0.41596000000000005,
									"y": -0.3612949999999999,
									"z": -0.08439500000000005,
									"scaleX": 0.08750000000000001,
									"scaleY": 0.08750000000000006,
									"scaleZ": 0.08750000000000001,
									"rotationX": -17.687777706115337,
									"rotationY": 87.7486011245313,
									"rotationZ": 131.55258539256383,
									"time": 0.13571
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_High_Debris",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Debris.fx",
									"x": 0.41596,
									"y": 0.3612949999999999,
									"z": 0.08439499999999996,
									"scaleX": 0.1041666666666667,
									"scaleY": 0.10416666666666669,
									"scaleZ": 0.10416666666666669,
									"rotationX": -101.68777770611538,
									"rotationY": 92.25139887546868,
									"rotationZ": -48.447414607436485,
									"time": 0.05
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
						},
						{
							"type": "object",
							"name": "Electricity",
							"x": 0.35632812662587077,
							"y": -0.9084850407973537,
							"z": 0.03290083109402078,
							"scaleX": 0.20833333333333337,
							"scaleY": 0.20833333333333337,
							"scaleZ": 0.20833333333333334,
							"rotationX": 4.409203776402943,
							"rotationY": -69.75322170649842,
							"rotationZ": -94.67973734665962,
							"children": [
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											10,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": 0.1,
										"emitSurface": true,
										"instStretch": [
											2,
											1,
											1
										],
										"instScale": 0.45,
										"instScale_rand": 0.15,
										"instSpeed_rand": [
											4,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2
									},
									"x": 0.22628,
									"y": -1.38692,
									"z": -0.62679,
									"scaleX": 0.9999999999999998,
									"scaleY": 1.0000000000000002,
									"scaleZ": 0.9999999999999998,
									"rotationY": -100.2,
									"rotationZ": 91.2,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true,
															"emissive": 50
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
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
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec03",
									"x": -0.6511,
									"y": -5.40409,
									"z": 3.09079,
									"rotationX": -73.8,
									"rotationY": 43.5,
									"rotationZ": -73.1,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
												"instScale_rand": 0,
												"warmUpTime": -2.5,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.45,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.3
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"depthTest": "Less",
																	"emissive": 10
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
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec04",
									"x": -1.54521,
									"y": -0.71368,
									"z": 4.98327,
									"rotationX": -62.6,
									"rotationY": 25.2,
									"rotationZ": 127.2,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
												"instScale_rand": 0,
												"warmUpTime": -2.6,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.8,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.8
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationY": 69.7,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"depthTest": "Less",
																	"emissive": 10
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
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 1,
																"power": 1
															},
															"isInstance": true
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
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec05",
									"x": 1.00976,
									"y": -3.7671,
									"z": -1.90612,
									"rotationX": 46.2,
									"rotationZ": 56.2,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
												"instScale_rand": 0,
												"warmUpTime": -2.7,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.85,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.3
											},
											"x": -0.07,
											"y": -0.68,
											"z": 0.12,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"depthTest": "Less",
																	"emissive": 10
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
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec08",
									"x": -1.24,
									"y": -3.27,
									"z": 0.42,
									"rotationX": -56.3,
									"rotationY": -18.8,
									"rotationZ": -92.2,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
												"instScale_rand": 0,
												"warmUpTime": -5.25,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1,
													1.2,
													1
												],
												"lifeTime": 0.1,
												"instScale": 2
											},
											"x": -0.54,
											"y": -0.75,
											"z": 0.32,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -23,
											"rotationY": 8.6,
											"rotationZ": -15.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"depthTest": "Less",
																	"emissive": 10
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
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.5137254901960784,
															0.996078431372549
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
									"name": "Sparkles01",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											7,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": -11,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.5,
										"instScale_rand": 0.15,
										"instSpeed_rand": [
											4,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2
									},
									"x": 0.6254,
									"y": -1.59114,
									"z": -1.82613,
									"scaleY": 1.0000000000000002,
									"rotationX": 98.4,
									"rotationY": -14.3,
									"rotationZ": 64.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true,
															"emissive": 50
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
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
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles02",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											7,
											0,
											0
										],
										"lifeTime": 0.6,
										"warmUpTime": -6.5,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.38,
										"instScale_rand": 0.2,
										"instSpeed_rand": [
											4,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstCount": 2,
										"burstDelay": 1.25
									},
									"x": -0.11808,
									"y": -5.5244,
									"z": 1.16569,
									"rotationX": 84.4,
									"rotationY": -46.8,
									"rotationZ": -61.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true,
															"emissive": 50
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Spark.png",
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.524747126051018,
																"dt": -0.08435811334917986
															},
															"nextHandle": {
																"dv": 1.1363636363636365,
																"dt": 0.038593750000000024
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.015151515151515138,
																"dt": -0.6513281249999998
															},
															"nextHandle": {
																"dv": -0.007748222232672166,
																"dt": 0.333317624512036
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
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
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles03",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											7,
											0,
											0
										],
										"lifeTime": 0.6,
										"warmUpTime": -7,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.6,
										"instScale_rand": 0.25,
										"instSpeed_rand": [
											4,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstDelay": 1.5
									},
									"x": -1.01551,
									"y": 0.58613,
									"z": 3.05958,
									"rotationX": -18.2,
									"rotationY": -33.7,
									"rotationZ": 69.7,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true,
															"emissive": 50
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.524747126051018,
																"dt": -0.08435811334917986
															},
															"nextHandle": {
																"dv": 1.1363636363636365,
																"dt": 0.038593750000000024
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.015151515151515138,
																"dt": -0.6513281249999998
															},
															"nextHandle": {
																"dv": -0.007748222232672166,
																"dt": 0.333317624512036
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
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
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.DroneE.root.B_ROOT.B_Top"
				},
				{
					"type": "object",
					"name": "SandFloor",
					"x": -4.679356666666667,
					"y": 0.04633666666666665,
					"z": 0.07663666666666669,
					"children": [
						{
							"type": "object",
							"name": "Sand2",
							"x": -1.8296833333333327,
							"y": -0.12881666666666663,
							"z": -0.07663666666666669,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "emitter",
									"name": "Sand_Floor",
									"props": {
										"instScale_rand": 1,
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
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
										"instScale": 12,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"burstParticleCount": 3,
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"alignMode": "Screen",
										"warmUpTime": -1.55,
										"emitOrientation": "Normal",
										"instSpeed_rand": [
											0,
											0.5,
											0
										],
										"seedGroup": 2,
										"lifeTime": 1.5,
										"burstDelay": 0.1,
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instOffset": [
											0,
											0,
											2
										],
										"burstCount": 2,
										"emitAngle": 360,
										"instSpeed": [
											0,
											1,
											-0.5
										]
									},
									"x": -0.07822,
									"y": -0.16484,
									"z": -0.25,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.5
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.6472728746925278,
																		"dt": -0.012445056058803479
																	},
																	"nextHandle": {
																		"dv": 0.9454545454545454,
																		"dt": 0.007142857142857143
																	}
																},
																{
																	"time": 0.45,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 8.922912650454184e-17,
																		"dt": -0.21499999999999997
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01694444444444443,
																		"dt": -0.27
																	},
																	"nextHandle": {
																		"dv": 0.013434004892663146,
																		"dt": 0.21406315992899264
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
															0.9098039215686274,
															0.9098039215686274,
															0.9098039215686274
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
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1116321015082125,
																		"dt": -0.3076091494743911
																	},
																	"nextHandle": {
																		"dv": -1,
																		"dt": 0.2774350174349862
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 28.79,
														"power": 38.64
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.7,
													"envBlend": 0.5
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.040734981627899014,
														"dt": -0.6732812499999992
													},
													"nextHandle": {
														"dv": 0.016048606913192237,
														"dt": 0.2659338296837626
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.6195399014805467,
														"dt": 2.975046534659357e-17
													},
													"nextHandle": {
														"dv": -1.1333333333333333,
														"dt": 0
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666663,
														"dt": -0.98
													},
													"nextHandle": {
														"dv": -0.005668855987316409,
														"dt": 0.3333287320541929
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Shockwave",
									"enabled": false,
									"props": {
										"warmUpTime": -1.6,
										"emitType": "Burst",
										"instScale": 9,
										"instRotation_rand": [
											0,
											0,
											360
										]
									},
									"z": 0.1,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"colorMask": 255,
															"depthTest": "LessEqual",
															"drawOrder": "100"
														}
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
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.23,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.21666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -2.090031350705387,
														"dt": -0.3895058426314596
													},
													"nextHandle": {
														"dv": 1.1,
														"dt": 0.20671875000000048
													}
												},
												{
													"time": 0.8467187500000021,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.9725490196078431,
													0.9725490196078431
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"enabled": false,
									"x": 0.91823,
									"y": 0.27741,
									"z": -0.28883,
									"rotationZ": 19.9,
									"children": [
										{
											"type": "polygon",
											"name": "Back_Sand_Stylised1",
											"x": -1.2336351669096297,
											"y": -1.0408340855860843e-17,
											"z": 1.3877787807814457e-17,
											"scaleX": 6,
											"scaleY": 5.5,
											"scaleZ": 0.06,
											"rotationX": -11.999999999999995,
											"rotationZ": -90.00000000000001,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 0.5,
															"drawOrder": "100"
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
														"alpha": 0.7,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_FlatSmoke.png"
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
														"progress": 0.5,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															1
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.3220455995233564,
																	"value": 0.9278444881777138,
																	"mode": 1
																},
																{
																	"time": 1.3220455995233564,
																	"value": 0.9278444881777138,
																	"mode": 1
																},
																{
																	"time": 1.3220455995233564,
																	"value": 0.9278444881777138,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.5337762368520101,
																		"dt": 0.42926778498909995
																	}
																},
																{
																	"time": 2.207972158153206,
																	"value": 0.03298432639640266,
																	"mode": 2
																},
																{
																	"time": 2.207972158153206,
																	"value": 0.03298432639640266,
																	"mode": 2
																},
																{
																	"time": 2.207972158153206,
																	"value": 0.03298432639640266,
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
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													}
												},
												{
													"type": "curve",
													"name": "position.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4582014049961511,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4582014049961511,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4582014049961511,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.8577085773244644,
															"value": -3,
															"mode": 0
														},
														{
															"time": 2.8577085773244644,
															"value": -3,
															"mode": 0
														},
														{
															"time": 2.8577085773244644,
															"value": -3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4665023907761046
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4665023907761046
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
															"time": 1.4824635891938254,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.4824635891938254,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.4824635891938254,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -3.216730645116172,
																"dt": -0.5298503198629724
															},
															"nextHandle": {
																"dv": 0.9,
																"dt": 0.14824532747268693
															}
														},
														{
															"time": 2.6679767086988537,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.6679767086988537,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.6679767086988537,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.5,
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
							"type": "object",
							"name": "Sand",
							"x": 3.427226666666667,
							"y": 0.058523333333333344,
							"z": -0.07663666666666669,
							"scaleX": 2.25,
							"scaleY": 2.25,
							"scaleZ": 2.25,
							"children": [
								{
									"type": "emitter",
									"name": "Sand_Floor",
									"props": {
										"instScale_rand": 1,
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
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
										"instScale": 16,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"burstParticleCount": 3,
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"alignMode": "Screen",
										"warmUpTime": -1.35,
										"emitOrientation": "Normal",
										"instSpeed_rand": [
											0,
											0.5,
											0
										],
										"seedGroup": 2,
										"lifeTime": 1.5,
										"burstDelay": 0.1,
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instOffset": [
											0,
											0,
											2
										],
										"burstCount": 2,
										"emitAngle": 360,
										"instSpeed": [
											0,
											1,
											-0.5
										]
									},
									"z": -0.25,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.5
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.6472728746925278,
																		"dt": -0.012445056058803479
																	},
																	"nextHandle": {
																		"dv": 0.9454545454545454,
																		"dt": 0.007142857142857143
																	}
																},
																{
																	"time": 0.45,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 8.922912650454184e-17,
																		"dt": -0.21499999999999997
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.36
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01694444444444443,
																		"dt": -0.27
																	},
																	"nextHandle": {
																		"dv": 0.013434004892663146,
																		"dt": 0.21406315992899264
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
															0.9098039215686274,
															0.9098039215686274,
															0.9098039215686274
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
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1116321015082125,
																		"dt": -0.3076091494743911
																	},
																	"nextHandle": {
																		"dv": -1,
																		"dt": 0.2774350174349862
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 28.79,
														"power": 38.64
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.7,
													"envBlend": 0.5
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.040734981627899014,
														"dt": -0.6732812499999992
													},
													"nextHandle": {
														"dv": 0.016048606913192237,
														"dt": 0.2659338296837626
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.6195399014805467,
														"dt": 2.975046534659357e-17
													},
													"nextHandle": {
														"dv": -1.1333333333333333,
														"dt": 0
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666663,
														"dt": -0.98
													},
													"nextHandle": {
														"dv": -0.005668855987316409,
														"dt": 0.3333287320541929
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Shockwave",
									"props": {
										"warmUpTime": -1.4,
										"emitType": "Burst",
										"instScale": 9,
										"instRotation_rand": [
											0,
											0,
											360
										]
									},
									"z": 0.1,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"colorMask": 255,
															"depthTest": "LessEqual",
															"drawOrder": "100"
														}
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
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.23,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.21666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -2.090031350705387,
														"dt": -0.3895058426314596
													},
													"nextHandle": {
														"dv": 1.1,
														"dt": 0.20671875000000048
													}
												},
												{
													"time": 0.8467187500000021,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.9725490196078431,
													0.9725490196078431
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SandJet",
							"props": {
								"instScale_rand": 0.9,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9803921568627451,
									0.9254901960784314,
									0.8980392156862745,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.9,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 5.5,
								"emitAngle": 155.45,
								"alignMode": "Screen",
								"lifeTime": 4.5,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.7490196078431373,
									0.6705882352941176,
									0.6313725490196078,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitRate": 1,
								"speedFactor": 2.5,
								"maxCount": 5,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"warmUpTime": -4,
								"emitType": "Burst",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									15,
									0,
									0
								],
								"burstParticleCount": 3
							},
							"x": -1.5975433333333333,
							"y": 0.07029333333333335,
							"z": 0.15327333333333337,
							"scaleX": 0.9999999999999999,
							"scaleY": 1.9999999999999996,
							"scaleZ": 0.1,
							"rotationZ": -157.8,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.25,
									"scaleY": 2.25,
									"scaleZ": 2.25,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6472728746925278,
																"dt": -0.012445056058803479
															},
															"nextHandle": {
																"dv": 0.9454545454545454,
																"dt": 0.007142857142857143
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.922912650454184e-17,
																"dt": -0.21499999999999997
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.36
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01694444444444443,
																"dt": -0.27
															},
															"nextHandle": {
																"dv": 0.013434004892663146,
																"dt": 0.21406315992899264
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
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.07,
													-0.05
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1116321015082125,
																"dt": -0.3076091494743911
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.2774350174349862
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.7,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.57,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.6,
											"envBlend": 0.5
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0967980860793232,
												"dt": -0.009802037467223067
											},
											"nextHandle": {
												"dv": 0.5569361461292616,
												"dt": 0.0049999999999999975
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0.010970089074337164,
												"dt": -0.575
											},
											"nextHandle": {
												"dv": -0.006359231507065358,
												"dt": 0.3333207316535249
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.0890297805850073,
												"dt": -0.11575828486016804
											},
											"nextHandle": {
												"dv": -0.9363636363636363,
												"dt": 0.03508928571428571
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.009090909090909038,
												"dt": -0.6245892857142856
											},
											"nextHandle": {
												"dv": 0.008774267419493307,
												"dt": 0.6028344762228577
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