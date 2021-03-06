package token.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import token.entity.JVDict;

@Transactional
@Component
public class JVDictService {
	@Autowired
	SessionFactory factory;
	public String getMeaning(String word, String reading) {
		String hql = "FROM JVDict WHERE kanji=:word";
		String meaning = "";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("word", word);
		List<JVDict> x = query.list();
		int check = 0;
		if (x.size() == 0) {
			String hql2 = "FROM JVDict WHERE hikaWord=:word";
			query = session.createQuery(hql2);
			query.setParameter("word", word);
			List<JVDict> y = query.list();
//			System.out.println("Check hika: " + y.size());
			if (y.size() == 1) {
				meaning = y.get(0).getMeaning();
//				System.out.println("****************Get Hika from DB**************");
			} else {
				for (JVDict jvDict : y) {
//					System.out.println("----" + jvDict.getHikaWord() + "------" + jvDict.getKanji() + "----");
					if (jvDict.getKanji() == "") {
						meaning = jvDict.getMeaning();
//						System.out.println("****************Get Hika from DB**************");
						break;
					}
				}
			}
			if (meaning == "") {
				check = 1;
			}
		} else {
//			System.out.println("Check kanji: " + x.size());
			meaning = x.get(0).getMeaning();
//			System.out.println("+++++++++++++Get Kata from DB+++++++++++++++++");
		}
		if (meaning == "" && check != 1) {
//			System.out.println("-------------------Get from web-----------------");
			meaning = ExtractTextService.extractMeaning(word);
		}
		return meaning;
	}

}
