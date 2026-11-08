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
					"name": "Harpy",
					"source": "Vehicle/Harkonnen/Harpy/Harpy.fbx",
					"editorOnly": true,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Harpy/Anim_Harpy_Run.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"y": 0.12018,
					"z": -0.49704,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"rotationX": 90,
					"rotationY": -90,
					"children": [
						{
							"type": "trails",
							"name": "trails",
							"scaleX": 1.5000000000000002,
							"scaleY": 1.4999999999999998,
							"scaleZ": 1.4999999999999998,
							"rotationX": -164.2606292447018,
							"rotationY": 10.490986963014187,
							"rotationZ": 14.559224654955193,
							"startWidth": 0.25,
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
										"scale": 0.5
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
					"target": "FXAnimation.FXRoot.Harpy.root.B_ROOT.B_Body.B_TailWing_Start.B_TailWing_Mid.B_TailWing_End"
				},
				{
					"type": "light",
					"name": "light_1",
					"editorOnly": true,
					"y": 2.98887,
					"z": -4.03598,
					"power": 2.42,
					"range": 20,
					"size": 2.05,
					"zNear": 0.02
				}
			]
		}
	]
}