{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Sting",
					"source": "Vehicle/Harkonnen/Overlord/Sting.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Overlord/Anim_Sting_AttackRange.fbx"
						}
					]
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 2.98887,
					"z": -5.95137,
					"power": 3.79,
					"range": 30,
					"size": 2.05,
					"zNear": 0.02
				},
				{
					"type": "object",
					"name": "Shot",
					"x": 0.00265,
					"y": -0.01502,
					"z": -0.33839,
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"rotationY": 90,
					"children": [
						{
							"type": "subFX",
							"name": "FX_MuzzleShot",
							"source": "Fx/Vehicle/Ships/Sting/FX_MuzzleShot.fx",
							"x": -1.15949,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"time": 0.1
						},
						{
							"type": "subFX",
							"name": "FX_MuzzleShot",
							"source": "Fx/Vehicle/Ships/Sting/FX_MuzzleShot.fx",
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Shot",
					"target": "FXAnimation.FXRoot.Sting.root.B_ROOT"
				}
			]
		}
	]
}