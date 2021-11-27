package command;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import tera.RequestContext;

public abstract class CommandFactory {
	public static AbstractCommand getCommand(RequestContext requestContext) {
		// nameによって異なるConcreteFactoryを返す
		AbstractCommand command = null;
		Properties prop = new Properties();

		try {
			// プロパティファイルを読み込む
			InputStream file = CommandFactory.class.getClassLoader().getResourceAsStream("commands.properties");
			prop.load(file);

			// Classクラスのインスタンスを利用して対応するクラスのインスタンス化を行う
			command = (AbstractCommand) Class.forName(prop.getProperty(requestContext.getCommandPath())).newInstance();

		} catch (FileNotFoundException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (IOException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (ClassNotFoundException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (InstantiationException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		} catch (IllegalAccessException e) {
			// 実際には独自例外にラップしてスローする
			throw new RuntimeException(e.getMessage(), e);
		}
		return command;
	}
}
