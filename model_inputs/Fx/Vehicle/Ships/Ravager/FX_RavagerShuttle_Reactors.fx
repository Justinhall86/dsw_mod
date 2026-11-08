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
					"name": "RavagerShuttle",
					"source": "Vehicle/Common/Ravager_Shuttle/RavagerShuttle.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"rotationZ": -89.99999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/RavagerShuttle/Anim_RavagerShuttle_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"x": -1.5051,
					"y": 0.37795,
					"scaleX": 0.13,
					"scaleY": 0.13,
					"scaleZ": 0.13,
					"children": [
						{
							"type": "object",
							"name": "Reactor",
							"y": -0.45339,
							"scaleX": 6.55,
							"scaleY": 6.55,
							"scaleZ": 6.55,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/Reactor_TaperedRectangle_bevel.fbx",
									"rotationX": 90,
									"rotationY": 180,
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
									"source": "Fx/Meshes_Common/Reactor_TaperedRectangle_bevel.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": 90,
									"rotationY": 180,
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
						},
						{
							"type": "trails",
							"name": "trails_Reactor",
							"x": 2.13675,
							"startWidth": 0.35,
							"lifetime": 1.5,
							"minSpeed": 5,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
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
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
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
											0.2627450980392157,
											0.45098039215686275
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "trails",
							"name": "trails",
							"x": 2.95174,
							"y": -13.55454,
							"z": 11.9,
							"startWidth": 0.15,
							"lifetime": 2.5,
							"minSpeed": 5,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
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
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.75
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "trails",
							"name": "trails",
							"x": 2.95174,
							"y": -13.55454,
							"z": -11.9,
							"startWidth": 0.15,
							"lifetime": 2.5,
							"minSpeed": 5,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
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
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.75
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.RavagerShuttle.root.B_Root.B_Body"
				},
				{
					"type": "light",
					"name": "light_1",
					"editorOnly": true,
					"x": -7.45383,
					"y": 0.63611,
					"z": -0.52419,
					"power": 2.42,
					"range": 20,
					"size": 2.05,
					"zNear": 0.02
				}
			]
		}
	]
}