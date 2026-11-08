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
					"name": "Kraken",
					"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Kraken/Anim_Kraken_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Lights",
					"children": [
						{
							"type": "object",
							"name": "Right",
							"y": 0.08052,
							"z": -0.00034,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -1.86587,
									"y": 0.65641,
									"z": -2.76094,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"rotationY": 54.2,
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
															"time": 2,
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
													1,
													0.6941176470588235,
													0.4784313725490196
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.56001,
									"y": 0.67775,
									"z": -2.37592,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"rotationX": 180,
									"rotationY": 54.2,
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
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21624389648437572,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21624389648437572,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3123522949218758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3123522949218758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.49656005859375074,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.49656005859375074,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
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
													1,
													0.6941176470588235,
													0.4784313725490196
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.36513,
									"y": 0.67775,
									"z": -2.80429,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"rotationY": -125,
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
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21624389648437572,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21624389648437572,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3123522949218758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3123522949218758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.49656005859375074,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.49656005859375074,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
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
													1,
													0.6941176470588235,
													0.4784313725490196
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Left",
							"y": 0.08052,
							"z": -0.00034,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 0.95507,
									"y": 0.66733,
									"z": -2.00673,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"rotationY": 124.4,
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
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
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
													1,
													0.6941176470588235,
													0.4784313725490196
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 1.68256,
									"y": 0.727,
									"z": -3.17359,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"rotationY": 45.7,
									"rotationZ": -180,
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
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21624389648437572,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3123522949218758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.49656005859375074,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
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
													1,
													0.6941176470588235,
													0.4784313725490196
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
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": 1.50696,
									"y": 0.73806,
									"z": -3.49314,
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"rotationY": -54.7,
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
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.32036132812500073,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4164697265625008,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5045690917968758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6006774902343758,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
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
													1,
													0.6941176470588235,
													0.4784313725490196
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
												"range": 1.5,
												"power": 0.8
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
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"x": 0.16342,
					"y": 0.20261,
					"z": -3.03622,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"rotationY": -90,
					"children": [
						{
							"type": "object",
							"name": "Reactor",
							"z": 0.04696,
							"scaleX": 0.8,
							"scaleY": 1.1,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
									"scaleX": 1.4,
									"scaleY": 1.4,
									"scaleZ": 2.8,
									"rotationX": 90,
									"rotationZ": -90,
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
													"emissive": 1.8
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													-0.01
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
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 3,
									"scaleY": 1.7,
									"scaleZ": 3.4,
									"rotationX": 90,
									"rotationZ": -90,
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
													"emissive": 0.5
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
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													-0.01
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
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
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
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Kraken.root.B_ROOT.B_Body"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Kraken.root.B_ROOT.B_Body"
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 11.8366,
					"z": -4.03598,
					"power": 4.24,
					"range": 20,
					"size": 2.05,
					"zNear": 0.02
				}
			]
		}
	]
}