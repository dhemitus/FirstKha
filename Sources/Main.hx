package;

import kha.Assets;
import kha.Scheduler;
import kha.System;

class Main {
	public static function main() {
		System.start({title: "Project", width: 1024, height: 768}, function (_) {

			Assets.loadEverything(function () {

				var project:Project = new Project();
				Scheduler.addTimeTask(project.update, 0, 1 / 60);
				System.notifyOnFrames(project.render);
			});
		});
	}
}