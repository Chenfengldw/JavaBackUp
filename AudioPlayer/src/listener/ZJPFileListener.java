package listener;

import org.apache.commons.io.monitor.FileAlterationListener;
import org.apache.commons.io.monitor.FileAlterationObserver;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import java.io.File;

/**
 * Created by Administrator on 2016/4/29.
 */
public class ZJPFileListener implements FileAlterationListener {

    ScriptEngineManager sem = new ScriptEngineManager();
    ScriptEngine se = sem.getEngineByName("javascript");

    @Override
    public void onStart(FileAlterationObserver fileAlterationObserver) {

    }

    @Override
    public void onDirectoryCreate(File file) {

    }

    @Override
    public void onDirectoryChange(File file) {

    }

    @Override
    public void onDirectoryDelete(File file) {

    }

    @Override
    public void onFileCreate(File file) {
        System.out.println("flie created:"+file.getName());
//        if(file.getName().endsWith(".mp3")){
//            try {
//                se.eval("createRequest()");
//            } catch (ScriptException e) {
//                e.printStackTrace();
//            }
//        }

    }

    @Override
    public void onFileChange(File file) {

    }

    @Override
    public void onFileDelete(File file) {
        System.out.println("flie deleted:"+file.getName());
//        if(file.getName().endsWith(".mp3")){
//            try {
//                se.eval("createRequest()");
//            } catch (ScriptException e) {
//                e.printStackTrace();
//            }
//        }
    }

    @Override
    public void onStop(FileAlterationObserver fileAlterationObserver) {

    }
}
