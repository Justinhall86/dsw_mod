{
	"type": "fx",
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "ResearchStation",
					"source": "Structure/Buildings/ResearchStation/ResearchCenter.fbx",
					"editorOnly": true,
					"locked": true
				},
				{
					"type": "object",
					"name": "Lights",
					"x": 0.027507500000000018,
					"y": -0.07955354166666664,
					"z": 0.7853954166666666,
					"children": [
						{
							"type": "light",
							"name": "light_0",
							"x": -0.0959075,
							"y": 0.16907354166666663,
							"z": -0.0665154166666665,
							"color": 26879,
							"power": 2,
							"range": 1,
							"size": 3,
							"zNear": 0.02,
							"children": [
								{
									"type": "curve",
									"name": "power",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.75,
											"value": 2,
											"mode": 2
										},
										{
											"time": 1.5,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "MainBuildingLights",
							"x": 0.05920249999999995,
							"y": -0.21754479166666674,
							"z": -0.22589208333333322,
							"children": [
								{
									"type": "object",
									"name": "Rside",
									"x": -0.35178999999999994,
									"y": -0.1284816666666666,
									"z": 0.08095166666666664,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"x": -0.02705000000000002,
											"y": 0.016000000000000014,
											"z": -0.0002849999999998687,
											"scaleX": 0.03,
											"scaleY": 0.1799999999999999,
											"scaleZ": 0.12999999999999998,
											"rotationX": 80.79999999999995,
											"rotationY": -1.0999999999999945,
											"rotationZ": -34.49999999999999,
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
															"emissive": 10
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
														"texture": "Fx/Gradients/Cyl05v_A.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.40784313725490196,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 0.5
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"x": 0.027049999999999963,
											"y": -0.01599999999999996,
											"z": 0.0002849999999999797,
											"scaleX": 0.029999999999999992,
											"scaleY": 0.18000000000000008,
											"scaleZ": 0.13000000000000006,
											"rotationX": 80.69999999999999,
											"rotationY": -0.3000000000000017,
											"rotationZ": -29.300000000000015,
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
															"emissive": 10
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
														"texture": "Fx/Gradients/Cyl05v_A.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.40784313725490196,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 0.5
													}
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "windowR",
									"x": -0.36254,
									"y": -0.14845166666666665,
									"z": -0.06318333333333326,
									"scaleX": 0.029999999999999995,
									"scaleY": 0.13,
									"scaleZ": 0.13,
									"rotationX": 5.1,
									"rotationY": -86.3,
									"rotationZ": 54.19999999999996,
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
													"emissive": 10
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
												"texture": "Fx/Gradients/Cyl05v_A.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.40784313725490196,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "windowL",
									"x": 0.4629500000000001,
									"y": 0.28809833333333335,
									"z": -0.06734333333333326,
									"scaleX": 0.029999999999999995,
									"scaleY": 0.13,
									"scaleZ": 0.13,
									"rotationY": 83.80000000000001,
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
													"emissive": 10
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
												"texture": "Fx/Gradients/Cyl05v_A.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.40784313725490196,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Lside",
									"x": 0.43023,
									"y": 0.28809833333333335,
									"z": 0.08475666666666681,
									"scaleX": 0.05,
									"scaleY": 0.19999999999999998,
									"scaleZ": 0.13,
									"rotationX": 82.40000000000002,
									"rotationY": 3.1805546814635168e-15,
									"rotationZ": 89.99999999999999,
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
													"emissive": 10
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
												"texture": "Fx/Gradients/Cyl05v_A.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.40784313725490196,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderStraight_Lamp",
									"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
									"x": 0.17294000000000004,
									"y": -0.1707816666666666,
									"z": -0.11613333333333331,
									"scaleX": 0.067,
									"scaleY": 0.06700000000000002,
									"scaleZ": 0.015000000000000003,
									"rotationX": 83.40000000000003,
									"rotationY": -0.1000000000000028,
									"rotationZ": 30.900000000000006,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.40784313725490196,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 0.8,
												"frequency": 0.5
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
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon_Inside",
									"x": -0.08609,
									"y": 0.31142,
									"z": 0.2624,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"emissive": 10
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
												"alpha": 0.5,
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
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.75,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 0.25,
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
													0,
													0.40784313725490196,
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
												"range": 1.5,
												"power": 0.8
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
												"progress": 0.42,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T-InnerGradient.png",
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
									"type": "model",
									"name": "CylinderStraight_Bottom",
									"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
									"x": -0.08241,
									"y": 0.2971,
									"z": -0.46842,
									"scaleX": 0.59,
									"scaleY": 0.59,
									"scaleZ": 0.02,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.40784313725490196,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 0.8,
												"frequency": 0.25
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
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "ResarchStation_window",
							"source": "Fx/Meshes_Common/ResarchStation_window.fbx",
							"x": -0.07659750000000001,
							"y": 0.11037354166666663,
							"z": 0.31411458333333353,
							"scaleX": 1.1999999999999997,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": -2.8,
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
										"texture": "Fx/Gradients/T_Square03.jpg"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.40784313725490196,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.25,
										"maxAlpha": 1,
										"frequency": 0.5
									}
								}
							]
						},
						{
							"type": "object",
							"name": "antenne",
							"x": -0.35261750000000003,
							"y": 0.6456235416666666,
							"z": 0.6014245833333333,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.0112,
									"y": 0.0043,
									"z": 0.16404,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationY": -2.8824454314593813,
									"rotationZ": -71.32306190789038,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "circle",
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.4,
											"rotationY": 90,
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
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.9417534722222223,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.9711631944444445,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.9438541666666668,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.9480555555555557,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.9564583333333334,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.9270486111111111,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
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
															0,
															0.40784313725490196,
															1
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.0118,
									"y": -0.00251,
									"z": -0.15637,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.35,
									"rotationX": -1.1199556842968921e-19,
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
													"parallax": 0,
													"emissive": 15
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6941176470588235,
													0.4784313725490196
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 2
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.40784313725490196,
													1
												]
											}
										}
									]
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
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderStraight",
							"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
							"x": -0.7160374999999999,
							"y": -1.027096458333333,
							"z": -0.5459554166666665,
							"scaleX": 0.28,
							"scaleY": 0.28,
							"scaleZ": 0.045,
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
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.40784313725490196,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.2,
										"maxAlpha": 0.8,
										"frequency": 0.3
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
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderStraight",
							"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
							"x": 1.3007925,
							"y": 0.08576354166666664,
							"z": -0.5417254166666665,
							"scaleX": 0.28,
							"scaleY": 0.28,
							"scaleZ": 0.045,
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
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.40784313725490196,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.2,
										"maxAlpha": 0.8,
										"frequency": 0.3
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
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
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