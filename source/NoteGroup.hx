package;

import flixel.util.FlxSort;
import Conductor;
import Note.PreloadedChartNote;

class NoteGroup extends FlxTypedGroup<Note> {
	var pool:Array<Note> = [];
	
	public function pushToPool(object:Note)
	{
		pool.push(object);
	}

	var notePopped:Note = new Note();
	public inline function spawnNote(chartData:PreloadedChartNote)
	{
		notePopped = pool.pop();
		if (notePopped == null)
		{
			notePopped = new Note();
			members.push(notePopped);
			length++;
		}
		else notePopped.exists = true;
		notePopped.setupNoteData(chartData);
	}
}